Return-Path: <linux-arm-msm+bounces-111561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mwJ8OOdRJWqzGwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 13:11:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8222F65058E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 13:11:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NVqi4toQ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jk02n1jH;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111561-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111561-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8C3B9300CC99
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 11:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB45C38E8BA;
	Sun,  7 Jun 2026 11:11:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB192D8767
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Jun 2026 11:11:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780830686; cv=none; b=YkCA6k4I1VBKUPRtOF8IbVZ7ik4A+bsb85vQ+G+KZKwsQYs02Tf0f0ukqtsoDQyxrxsWt+pG4GoFUndxgRNKcpUaPTFcfM3mGQkPh0eHR7iuwXPY6JScb4lS+wLX7bckFI0KsIVu7HdpiZYtjohCTtFNStAwk4bzGPcwllg+hAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780830686; c=relaxed/simple;
	bh=sMsp642kKY2y2R6hX/UTzXvkYUwhH5hKMqWVKhO2G1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nUjGDAx711gNznCqGMzjsfBHkcUxDxzIKajtzLq64wmbi+EW/U8tQ6iBAd8sFRoW5QyJJecTsyrNqyY9qbXN6SphTzz0iGJRylnab6b2liPCdHDWudTYgowfk7mOhBI/6Ysr9Va+Xz0zv7QhFi6uVt57ZZ+nnHecB8LIxyP+jSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NVqi4toQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jk02n1jH; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657B1kdH436702
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Jun 2026 11:11:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NhkfC+zO5m2l38KnMKzme9p0
	QV8URIExTzvGlgOcfvs=; b=NVqi4toQWG/8NpCIEkwap5h7Fh6rO84WOMC1eCMm
	SQoftjUEkBk3NCDA0Oi16HEoabXsX/kMfCxoOoUyN7FhHDzO0Ep6JobAXV0neueY
	FFSa0yv31znli7LKYh6ZGdpc7t3ILP8gx6gPETCfJPX1K7fLxIfPcPD3Ahd1phY/
	eF9wGvNQaT/dXPzGb46vh1hcpFJVKxXrW62FpXxZXGcMWgdo+Fqc/6L1tYV4hfe4
	6QADlQ10UHY8cahv0iXIWkOcYXNS3FjpoFhCSyLKYpZFTfGZzpTk4Fpf84G4v4v/
	n5IIlVpFJLJp2rqP2C7rpH4GFd0UDL3/6BBHMP2Z8v+uSg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emaj4uxxa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 11:11:22 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ab02fb4f39so2231228e0c.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 04:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780830682; x=1781435482; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NhkfC+zO5m2l38KnMKzme9p0QV8URIExTzvGlgOcfvs=;
        b=jk02n1jHSUalvijTDIy3hXAPO+MkgTnx1ZY21NNr/rZR0PnNKfg3AigGtAHFeNO+D6
         7m+XDzZVO7ZwmGFV4k7eYkcTThNVDUldIFnH1dsjejfqT7gYTyyhyUSD9JQsn7AL74bT
         xWAvkwliIMcHonhVFYx9pi0lYLtqe48RWi6Kp2LaUQZ9R89JLAqcBgriv2MvnwBDjQgm
         7K/wouE4r1pAsTCnx/fpbWBr6iWL47FO7I6Z7VNxdix51X4sw8QWysRdwDR2DQk+UocD
         dGXRF7yns7ser56HEKVmjaOUvOE+YEo7ExHlK1vMAjLBiCcgJy6qWdh5NlGzY9HMlbfo
         h/Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780830682; x=1781435482;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NhkfC+zO5m2l38KnMKzme9p0QV8URIExTzvGlgOcfvs=;
        b=FkiLSKoBz6JVGWjZG5cP7OeNOxeVPT7FgnpvIJppQwt94XjTjP6eGD7mj6vARaTGWs
         BXvKD25v5V6KQWHTrXA5BVjsYXUo/M8GqwCTI4VTRnOkwKOYidBvGHyZwiim1HoyexES
         11ZsSRwsP/w+g+ZLrT93mFd4rRlz7bBls4Nq8ckHBS7vFJCJ7RFhrXHcQHY328bcvYg8
         +kb2wq/IYbi2PkSYe+8iywo3nRgKXfrKHDNjHPmBFTzKHIEzVoVRSUsaPq1mBCBKIjRr
         Gz9VJfgqq4WttlZwKHpKTrtp+k90DalO8qFRWiS7Uf0OpBomaSrBdt/YsrJg88n4a6sp
         DVog==
X-Forwarded-Encrypted: i=1; AFNElJ+HvX1rA0LBIUrBqs1LLhJpac3KA1QokUr9AIc7pbHZBj8ms8JsbWctvthScccQl1MVWgVN4WoVuBZu97WF@vger.kernel.org
X-Gm-Message-State: AOJu0YzKzT4LzXxBek1UcyX507K1aww4X5G13xt27Gmx8WxBiPfIy05V
	nPQ0tZ6IWD0FjaFrOGQ4LJr4lP8I8iuTDsxuKHfIKjmVb+WrvjCQjn50Ozo7f6okDYky/9zIfEL
	880twho/5k8hwkjuJFGMqa+hn89ilts0hIgO7S7XYv7ojCWfW9ajNj/AskWQ+S8NaCIYc
X-Gm-Gg: Acq92OElZ+yDZs1bhkfLrEX8nJ4WoAPpfJ3WZelaj8wr4XLL3XIw9JWDTEAxA4P3B/I
	1+xfrkG7t9yG3HJMkzeGIMbVp1ScnUbahfC5Z6kdB7HYgLHGS1r9Jz23j3Z5Dqa+N2sZVrT5pN7
	iI++VxHh+AGl6sBzI+bsr3y1waO5deLsYfRHzuCtwp0E5BMPWC6zhgmUFugs+I4atbOM0S9uytt
	rte6i8s0dL8x2PGdiU4eCByHZ9bIsaSMq4dF/NNY7BYXDDyYPkBhgP9MZpvOE5Zdiw70mj1uD0d
	TAyOiPLDQQq4AR6jGP4dnnfKMe8FygQZckenN62YDAlkwBK5A20NCJBz+52xvHrbQfe66KHI7Dc
	T6SMC+AJTUUHhR3F/HR8bKO4tfyDSgcbupLDvf3owydakwBbrZehppXnKug7DqcxtaYyLNJF/4T
	m3S2J0hyFQs7avozyQCG7i5GYiJr28tV3NRvIcLkhgPdWDTA==
X-Received: by 2002:a05:6102:1609:b0:643:80f1:33d8 with SMTP id ada2fe7eead31-6ff0294a345mr5115489137.4.1780830682060;
        Sun, 07 Jun 2026 04:11:22 -0700 (PDT)
X-Received: by 2002:a05:6102:1609:b0:643:80f1:33d8 with SMTP id ada2fe7eead31-6ff0294a345mr5115485137.4.1780830681536;
        Sun, 07 Jun 2026 04:11:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8fba62sm3068943e87.19.2026.06.07.04.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 04:11:19 -0700 (PDT)
Date: Sun, 7 Jun 2026 14:11:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: github.com@herrie.org
Cc: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: interconnect: qcom: add msm8660 NoC
Message-ID: <xhuunpe34foapf7klna4otsyw3nah3ihb6frjw2omzrc53vhzm@qbzrnrdinehn>
References: <20260606-submit-interconnect-msm8660-v3-0-f9da0158cdf8@herrie.org>
 <20260606-submit-interconnect-msm8660-v3-1-f9da0158cdf8@herrie.org>
 <wypnu53w5pesj52zyrj3pydqzf2rbfrxa72uplz3mq64u447wf@gypyaug7iwkd>
 <d6a95e9626845469764a11587ed65c7e@herrie.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d6a95e9626845469764a11587ed65c7e@herrie.org>
X-Proofpoint-ORIG-GUID: ykA4LwqY3-QgiKWwfNZZoc51ZfRTMSUl
X-Proofpoint-GUID: ykA4LwqY3-QgiKWwfNZZoc51ZfRTMSUl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDEwOSBTYWx0ZWRfX2M8mkACPSbqv
 DB4H5iFcT+jLOyX5TeUYZXrsTUglCuUnGUNBJGbB7MIJHPPV1mOJvIuhQ4loFuiZ09DQ7BP4F5B
 zYUo8fGlujWbwG2ChmBNrXPF9UclcQ3bDFqcOim/FuCd33xCqXnkkTWRhqCC/SG79xI3Qln8CVH
 u/hXxX/1WuFYL1MA4JgnUfZtmKVxVHtT2RpBiHzrA2mpO2IUzaQi1vLRDOFLbTGnzn2TryR9Z5B
 Uhd3Np5gjkib5iYQ+c864FdlLgLoaQOkt5SXYvksmJsINbS48PscBSFjMW5r6r977qH94rJ+ikp
 PIukziXZpxsLIsV+U058UmA/7hwvoOkOeACx+vUJe1DVN/2Xt/LAXPgxZIt2kaZ7qYl3cpg4/VC
 8Zda1MUvVDKqiuf4tGd3mo9qzuyQgHIDgRZ8//DXQK0n2J4UpHb6AleHFHJzOHbfbj/PBNY8lMS
 xSyP/j1jgsJ2UU/KNPw==
X-Authority-Analysis: v=2.4 cv=TLh1jVla c=1 sm=1 tr=0 ts=6a2551da cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=gEfo2CItAAAA:8
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=cTwmTnRGAAAA:8 a=OCxULHVomhrf1m7jPP0A:9
 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=cvBusfyB2V15izCimMoJ:22 a=GUWCSGlMWfG-xDt5EnV5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070109
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111561-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,herrie.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:github.com@herrie.org,m:djakov@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8222F65058E

On Sat, Jun 06, 2026 at 04:32:21PM +0200, me@herrie.org wrote:
> On 2026-06-06 15:23, Dmitry Baryshkov wrote:
> > On Sat, Jun 06, 2026 at 02:34:50PM +0200, Herman van Hazendonk wrote:
> > > Add a dt-binding schema and an interconnect master/slave ID header for
> > > the MSM8x60 family (MSM8260/MSM8660/APQ8060) Network-on-Chip.  The
> > > chip exposes four NoC fabrics that the qnoc-msm8660 driver models:
> > > 
> > >   AFAB  - Applications fabric (Scorpion CPU + L2)
> > >   SFAB  - System fabric (DMA, SPS, security)
> > >   MMFAB - Multimedia fabric (MDP, GPU, camera, video, rotator)
> > >   DFAB  - Daytona fabric (SDC, ADM master/slave)
> > > 
> > > The schema covers all four compatible strings, per-fabric clock-name
> > > lists (bus / bus_a / ebi1 / ebi1_a for AFAB; bus / bus_a / smi /
> > > smi_a for MMFAB; bus / bus_a for SFAB and DFAB), the required
> > > qcom,rpm phandle through which the provider hands the arbitration
> > > buffer to RPM firmware, and #interconnect-cells = <1>.
> > > 
> > > The ID header lists per-fabric master / slave / gateway indices
> > > derived from the legacy vendor msm_bus_board_8660.c enums,
> > > normalised to the upstream interconnect-framework naming convention.
> > > 
> > > Assisted-by: Claude:claude-opus-4-7 Sashiko:claude-haiku-4-5
> > > Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
> > > ---
> > >  .../bindings/interconnect/qcom,msm8660.yaml        | 166
> > > +++++++++++++++++++++
> > >  include/dt-bindings/interconnect/qcom,msm8660.h    | 156
> > > +++++++++++++++++++
> > >  2 files changed, 322 insertions(+)
> > > 
> > > diff --git
> > > a/Documentation/devicetree/bindings/interconnect/qcom,msm8660.yaml
> > > b/Documentation/devicetree/bindings/interconnect/qcom,msm8660.yaml
> > > new file mode 100644
> > > index 000000000000..ff28c7d46c32
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/interconnect/qcom,msm8660.yaml
> > > @@ -0,0 +1,166 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/interconnect/qcom,msm8660.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Qualcomm MSM8x60 family Network-On-Chip interconnect
> > > +
> > > +maintainers:
> > > +  - Herman van Hazendonk <github.com@herrie.org>
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/clock/qcom,rpmcc.h>
> > > +
> > > +    interconnect-afab {
> > > +        compatible = "qcom,msm8660-apps-fabric";
> > > +        clocks = <&rpmcc RPM_APPS_FABRIC_CLK>,
> > > +                 <&rpmcc RPM_APPS_FABRIC_A_CLK>,
> > > +                 <&rpmcc RPM_EBI1_CLK>,
> > > +                 <&rpmcc RPM_EBI1_A_CLK>;
> > > +        clock-names = "bus", "bus_a", "ebi1", "ebi1_a";
> > > +        qcom,rpm = <&rpm>;
> > > +        #interconnect-cells = <1>;
> > > +    };
> > > +
> > > +    interconnect-sfab {
> > > +        compatible = "qcom,msm8660-system-fabric";
> > > +        clocks = <&rpmcc RPM_SYS_FABRIC_CLK>,
> > > +                 <&rpmcc RPM_SYS_FABRIC_A_CLK>;
> > > +        clock-names = "bus", "bus_a";
> > > +        qcom,rpm = <&rpm>;
> > > +        #interconnect-cells = <1>;
> > > +    };
> > > +
> > > +    interconnect-mmfab {
> > > +        compatible = "qcom,msm8660-mmss-fabric";
> > > +        clocks = <&rpmcc RPM_MM_FABRIC_CLK>,
> > > +                 <&rpmcc RPM_MM_FABRIC_A_CLK>,
> > > +                 <&rpmcc RPM_SMI_CLK>,
> > > +                 <&rpmcc RPM_SMI_A_CLK>;
> > > +        clock-names = "bus", "bus_a", "smi", "smi_a";
> > > +        qcom,rpm = <&rpm>;
> > > +        #interconnect-cells = <1>;
> > > +    };
> > > +
> > > +    interconnect-dfab {
> > > +        compatible = "qcom,msm8660-daytona-fabric";
> > > +        clocks = <&rpmcc RPM_DAYTONA_FABRIC_CLK>,
> > > +                 <&rpmcc RPM_DAYTONA_FABRIC_A_CLK>;
> > 
> > Looking at it, I don't think those clocks sould be exposed here. Please
> > follow what Konrad did some time ago for smd-rpm interconnects: add
> > direct voting to the interconnect driver, them drop them from the clocks
> > driver. Ping me if you need help finding corresponding patch series (as
> > there were few more tricks.
> Feel free to send it. This is my first work on kernel ever and to be fair a
> lot of it comes from piggy backing on previous work, legacy kernels and
> insights from Claude & Gemini.
> 
> I can say it "works" for my limited tests, but I haven't run a full fledged
> OS yet to stress test most things.
> 
> HP TouchPad boots, audio works (though no Q6 (yet)), graphics works (Adreno
> 220), camera works (camss & vfe31), video plays via vidc, rotator, vfe
> works, sensors work (ALS, magnetometer, gyro), leds work, usb works,
> touchscreen works. Only thing I'm struggling with is wifi & bluetooth for
> the moment. It could very well be that when I rework things "properly" my
> wifi and bluetooth issues disappear and start to work. This old silicon is
> very unforgiving when it comes to bits set the wrong way.
> 
> So any guidance is much appreciated :)

See https://lore.kernel.org/all/20230526-topic-smd_icc-v7-0-09c78c175546@linaro.org/

Note, it bears some backwards compatibility quirks, which you don't
need, because we never had interconnects on those platforms. The only
issue, as I wrote, is SCM on APQ8064. But, I think, the clock was added
there only to fulfill the bindings. I'd say, ignore it for now.

> 
> As always there are multiple roads that lead to Rome :)

-- 
With best wishes
Dmitry

