Return-Path: <linux-arm-msm+bounces-112848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cc0mHpylK2pxBQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 08:22:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED202676E51
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 08:22:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jZFgzOXK;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=P7a8XEre;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112848-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112848-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9237431CA90D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 06:22:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05A64391E4B;
	Fri, 12 Jun 2026 06:22:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B2337DEBE
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 06:22:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781245336; cv=none; b=F0jLrLk1mbPkpR3LC58xMlYtulqBVEeBya0//NnFAUzul6FgxgW9xf5nOTDPjAkxeOy6tEJmdiYUPScyuzKYdUsgqdkJic05wrI/3yrN+14+PH1kofIAau1AwZb0vl7qm1bCEFX03kQBvwJuSTsDEt5elITuzemiMt4EPKPrUrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781245336; c=relaxed/simple;
	bh=9iqy1lLQxvVwdgkFr/jdiScy6r805+sd9YPN4XMJ5oo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iILVPvp/rJWmsYCmJdmIuvdirfB9aEzWKovwxzlOkshpiZAoLDjHIz4ijhQHieshlcqVKQtH1Scw7tfsZuJBpi31C2qqi9ZOc8SrGGfnS+oMC3qoiigSvIjQMVQUh9M/cQn4CG0A/UnQH0t+O4soIYCeaz7q0iHfw5nOZioC074=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jZFgzOXK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P7a8XEre; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C39eS22411611
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 06:22:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=n7Yf1YYFjiuiIuFcDTEBV9uJ
	IVRQFm5qqW6YmchUZPg=; b=jZFgzOXK9pKsRi2r5t7j3LL0DzuWJGnuEJvYH0Gd
	CXK0x0Sn8WX7d28XX2Qz7rbvbz0nvfJyJYkG+FxBa9SzhEK4XlckEZuuhHxna15m
	vQau1gp5ZqWskc7mVmf3RgoBBRCDbr93dKQ3/iZXoTIPGpn43K/DYvfF/ESw+/ez
	SfllUhLNKp/jFNUCroHLzTdp+KhLZACJLyb+6Jzi5EIdsX/YZTeruBfkA7lEG9uN
	cm7OYFoCOyU7WheX24qlJsN969sn17nYm6PUT1GTRhsbdPR7bWRKfXkkMHpNaN2q
	rYhXJYf6wLuamA70or1UgOrWYGzLoqKtf1lSGMtgC1F7+Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er165ackh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 06:22:14 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-517c65e497eso11239961cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 23:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781245334; x=1781850134; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n7Yf1YYFjiuiIuFcDTEBV9uJIVRQFm5qqW6YmchUZPg=;
        b=P7a8XEresDdl0eww1tsRJN1CQ+AFQSv15H0dUStl5O3MG9o4hQbdgk0hl73i0Nw2MK
         WBNEZeRqeb3hVOM4fhRHWTZgVSty1ZeXZg7n6S7WlikaL6V12t1NG6rjFrqYmN+NVSnz
         WyD4r+NFmVkDzPW2gqiblklKDWPLsAzWWhYKnAcItK2LI12CgEyTb4/U7uvC0kU7MAuE
         y6ul1KC1UJYTgCGOryIYCMnL3YyYZTQqoeInokm30k8tff7vIWep+guXbbTFtoup+m7j
         o+QCtJK3/UhBLjGpzg7BjiT9G26gbhXZxFDsKLsCPdf453j4Pq6Y23uPAYrhVEPBwTjT
         SW2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781245334; x=1781850134;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n7Yf1YYFjiuiIuFcDTEBV9uJIVRQFm5qqW6YmchUZPg=;
        b=JvwQBZtYvCaAbkmhmBLwurKWOkoz0iqeDiT0yckfMDF9aDobpoBFT7Kf+tEv4zY6G9
         TgXRXTkobyxDEWx3KWHdbD1oU28sU3lcP8eDuN0v5kLP0RLqVzs6IC8PS08l29wXsKoY
         THyKt3cICWo1b71THG9wKeoqzNCB4TY/UD8f0zSlS60rLEcpsosqflOEqzE58BY5AGcP
         heWGH2eyyu449+Xwbmd+Y+YfPj0tG1W7x2bQhPJC7agYiatZmatJn/ZQTxZxT1/2lYTC
         04LK3nfW1DZ4yPUztbBfaDVtjSnf6uE3mEuZ50XZxUM1Z0tY/Oy4iIpmO57wqbE8WVml
         3t/w==
X-Forwarded-Encrypted: i=1; AFNElJ8pKeeonspuIg8UwzUqmxIkF7SFng/issrxlN0m5ynaAzK00T7aA3dD6sachXJJXf9gT2SDJ6HsuMDs/nPu@vger.kernel.org
X-Gm-Message-State: AOJu0Yzob6CZ/niucdNJlfRAZ7sGpdsTicAGPRXURPI8OIfk50yQLEm1
	FpuXbO709KLQb/EtYaBkoWboCFcz3sw6bLDDYRZtZ6V5G+QiXkyWeynZMsGL1OVnn90iinYIVzI
	y/Id/zlR+5GazcMpN8DdaeKMnvJpzlQm8/OX3HQL0r+SJ8N4GS4yF7g5PlZepJYjePiJx
X-Gm-Gg: Acq92OFTTGK4i+irI2ZbMCC6o2pAOE+QQ1xrJ9KcFVnuutcrGngN6Op2vHKWl16dlQB
	Wps21rrJjhehh0L3pWM6MGZ0F9lm/oyEE66VpwlJ3UnnAplc9KLHzv5ntrLvLwkP0+wJdan3gTl
	/3ahrPnnxv+e/HMO1EesJvnEo0Zn5bUCYtCxXroGKYISIGnr/SjIGnGFvj22NHhziisnXLnlp8C
	m27kJ5gmz8eIw3ZtXB2s/FxhyzBeQa2rdLy/5NIGcADgKHCWWNj4OvNXUY6IZcEtaSXzN1vH2H/
	MojsmP2gx/kEZ7OqxsQj2L8sM7kHETqQlPhVNWWXJEOZnojZD0cWBylIKmZAcEKpuDNKk7brhCR
	0BK1kN3CR/ritUKjU70keFxZxHTAitFR/PhFOehDdKDqdQV5yGJrgG31EAetiS3MwVldnFYE0mB
	+4PDZXhnXhEQ7ouvYDJrBwfuRbaq0QIC3T/vo=
X-Received: by 2002:a05:622a:1109:b0:50f:b257:9301 with SMTP id d75a77b69052e-517fe566319mr18736041cf.52.1781245333850;
        Thu, 11 Jun 2026 23:22:13 -0700 (PDT)
X-Received: by 2002:a05:622a:1109:b0:50f:b257:9301 with SMTP id d75a77b69052e-517fe566319mr18735801cf.52.1781245333414;
        Thu, 11 Jun 2026 23:22:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1aeb6dsm253549e87.64.2026.06.11.23.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 23:22:12 -0700 (PDT)
Date: Fri, 12 Jun 2026 09:22:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Matthew Leung <matthew.leung@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: PCI: qcom: Document the Hawi PCIe
 Controller
Message-ID: <m2kwzigrz4fbdedzr2bj2auqtvafj6qstbplghssato4d6tdnd@ftug3clgxmd6>
References: <20260529-hawi-pcie-v2-0-de87c6cc230c@oss.qualcomm.com>
 <20260529-hawi-pcie-v2-1-de87c6cc230c@oss.qualcomm.com>
 <2tenqkmwcr2gshtjwh44pvban4gtlzcgrm3iibkfrs4zh6vphb@h5losfunylr6>
 <aiteRU8cWykuhlVO@hu-mattleun-lv.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiteRU8cWykuhlVO@hu-mattleun-lv.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA1NSBTYWx0ZWRfX7vpagepqPmjC
 3MuXX8SyHTAyqfG5ZQQ9enVu3bisJdg4B5lE7FyqZOMiBWbL8BAy/RU+HA04DM0lhB9jpAo9MDw
 Znzw2yc44yYsSpqoM4hvaaXYTtKnvJAfDMBMx35dYjpxMsD0DmHG8rI/Bc2Xgc42PtR9g9r01SA
 65z1qzC1+Eh7OgJ0fmjaqG2rZu5u+mCg3MOW5aGvHtIjqChrJx9vioGcTimNvlSXr1as5JD7tlo
 guHmk/wrpj1SZh2rZd4TAy3VFWQ59d41Qkgt5ZW3Evgy9KS0BIlqKLQbPRyhMzVQalcZc5kf1zb
 LKvzibpLLJRwKRkhCAkYmG5llf6jrYMMLm/0oIKJO34+9BgCae/NK3VN0M3QwLPlQK3C5EnZmaI
 FZe1zwnfed+FOrjXSt4ii6bWS8eq+0ViAnqi16fxGCDvDxt3ZdK5dHFz233w31wZoDhs6jvEZEk
 Me+KxuuOzYYWHYlRF3Q==
X-Authority-Analysis: v=2.4 cv=LNpWhpW9 c=1 sm=1 tr=0 ts=6a2ba596 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=onbnNvR133blzQGUTA0A:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: ODd2_PnGRKCUfL8gcmEPuspsBxrG4WI-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA1NSBTYWx0ZWRfXyPouVljOjXUR
 i9H3uWg7qK1zIvBcgK6bwJ9GuWO7wHcdGyA6OxlAGNdUx333peKovw13NZWPUFyTgK+JKXYE2oD
 EeI1oZanb+LmAE3V0aKuOI7MDq0gG8o=
X-Proofpoint-GUID: ODd2_PnGRKCUfL8gcmEPuspsBxrG4WI-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120055
X-Rspamd-Action: no action
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112848-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:matthew.leung@oss.qualcomm.com,m:bhelgaas@google.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,ftug3clgxmd6:mid,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ED202676E51

On Thu, Jun 11, 2026 at 06:17:57PM -0700, Matthew Leung wrote:
> On Sun, Jun 07, 2026 at 11:01:10PM +0300, Dmitry Baryshkov wrote:
> > On Fri, May 29, 2026 at 01:10:08AM +0000, Matthew Leung wrote:
> > > Add a dedicated schema for the PCIe controllers found on the Hawi
> > > platform.
> > > 
> > > Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
> > > ---
> > >  .../devicetree/bindings/pci/qcom,hawi-pcie.yaml    | 204 +++++++++++++++++++++
> > >  1 file changed, 204 insertions(+)
> > > 
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/clock/qcom,hawi-gcc.h>
> > > +    #include <dt-bindings/gpio/gpio.h>
> > > +    #include <dt-bindings/interconnect/qcom,icc.h>
> > > +    #include <dt-bindings/interconnect/qcom,hawi-rpmh.h>
> > 
> > Stop referencing clocks and interconnect header files. Replace used nocs
> > with ephemeral values.
> > 
> > > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > > +
> > > +    soc {
> > > +        #address-cells = <2>;
> > > +        #size-cells = <2>;
> > 
> > Not looking around should be a sin. Take a look at other Qualcomm PCIe
> > bindings. Compare them to yours. Then fix yours to follow.
> > 
> > Hint: the extra soc node is useless. This is just an example, so use the
> > default, 1 cells for address and size.
> 
> Thank you for the feedback. This new binding follows the examples set in
> the qcom,pcie-sm8x50 bindings and retains the same formatting (extra soc
> node and header references).

Hmm, interesting. Then I'm a sinner :-)

I looked at msm8996, but I didn't notice that the rest of the files use
the soc node (and match what you've sent). Please excuse me.

> 
> I understand the example can be simplified with your suggestions but
> want additional confirmation that these will be the convention for new
> bindings going forward.

At least, let's keep it for now. The other comment stands. To remove
dependencies please use ephemeral nodes instead of depending on DT
bindings from other subsystems.

> 
> > 
> > > +
> > > +        pcie@1c00000 {
> > > +            compatible = "qcom,hawi-pcie";
> > > +            reg = <0 0x01c00000 0 0x3000>,
> > > +                  <0 0x40000000 0 0xf1d>,
> > > +                  <0 0x40000f20 0 0xa8>,
> > > +                  <0 0x40001000 0 0x1000>,
> > > +                  <0 0x40100000 0 0x100000>;
> > > +            reg-names = "parf", "dbi", "elbi", "atu", "config";
> > > +            ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
> > > +                     <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x3d00000>;
> > > +
> > > +            bus-range = <0x00 0xff>;
> > > +            device_type = "pci";
> > > +            linux,pci-domain = <0>;
> > > +            num-lanes = <2>;
> > > +
> > > +            #address-cells = <3>;
> > > +            #size-cells = <2>;
> > > +
> > > +            clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
> > 
> > <&gcc_pcie_0_aux_clk>, etc.
> > 
> > > +                     <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
> > > +                     <&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
> > > +                     <&gcc GCC_PCIE_0_SLV_AXI_CLK>,
> > > +                     <&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>,
> > > +                     <&gcc GCC_AGGRE_NOC_PCIE_AXI_CLK>,
> > > +                     <&gcc GCC_CNOC_PCIE_SF_AXI_CLK>;
> > 
> > -- 
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry

