Return-Path: <linux-arm-msm+bounces-113066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tbLcILR3L2qJBAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 05:55:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 239896832B6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 05:55:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=PBqZaOn1;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AMHa9Zzm;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113066-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113066-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B57FF30075C7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 03:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F3412DC344;
	Mon, 15 Jun 2026 03:55:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A8A2C0285
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 03:55:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781495728; cv=none; b=b0YiR8aY2X9nZtl3snu+GkvqzyCwnP7asmHZSiiDCQLbJ2vNCPFL3q1+GieUw2X4amsZFtSrVtnYHIfS7ALsKOnHbm3CTskDeGFCg1R7P6TU9iAgFGweCA/r+ocEHHh3k+3CoBauF+GMgrlycEmG+tkTS+xMOX+wJYZMTLEmU1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781495728; c=relaxed/simple;
	bh=L15k8u3orIgT0R6SYaW0sHn7giGstxi9IUpykbO6UXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VErNH3cJmToaBkD0wprWy9zP9Zd3EtFlnsQ4advHCR53CsnsfhCIkLitPJlhdxSom4Bqfmzxe+N7kvbQz3jPee+LrKLNzHWmoCvTB0sodKMHneYCF5z3P6DgF04eS080Wavyx7qQ6B7ty+WHya61KxHTF0QJo9jI/jivXB6++A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PBqZaOn1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AMHa9Zzm; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F1kxC63109081
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 03:55:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=V5iYWamYBGi2g8X7XD8Ib5OY
	dq2ngK3owfPK32tRL48=; b=PBqZaOn1Mm3Oh21rL2hiBioLYSupkG3cmm4KUfYe
	mxmuJm7Fm5A19YvPHu6zLwEKJVGvRvSCgGVeYdo/NBzXqDM3lYkRzU9tF9JEtaNJ
	5VTXoNHPQaceMTusIrT+dc2hdQJ1FTvHfiQEW+Np3V/D+/HcwhCClYB+idhK6CwA
	+vTGh3weu/DDo7VhLdLaxAhsHhWz4MNWJYwJ8f9R76jmz9QKqVkm+guTftMjK3kC
	6yATU0P5UCM827/3ekTbic95ipQZMw+IxZN5jLtjdq2QM1jsdst/ewu2rCWLK7og
	cgB4+/mjT7mWnD1gOPKDfSwSBUiBrJZwVaE5Knt1jvrv+w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery955awd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 03:55:25 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c86487a8ce1so3060715a12.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 20:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781495725; x=1782100525; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V5iYWamYBGi2g8X7XD8Ib5OYdq2ngK3owfPK32tRL48=;
        b=AMHa9Zzm9A5ymAgh5yxiVeY/6sSOiywDTHAhC/qtVPophLSr98dSRoAtEM2Bqg4BwN
         rcTvHLBaObZsjMRuDrtdxZ53nnvRiM5jTySmRisyeO6E9dWE6uhItkUlgOSqu/7mzTg5
         S5LF6Nqy4gak25iEDeHkAQcJp5O+jRveDVhWeRvdXofloEW8G7qpjeRXbmzg2Wkw5leU
         AHuNxBXIGYiqhjUynlKUPY7tB+FDOjZo2vt65Zs+setmMfDaTsyx7KXqbIS3C8BMmlv3
         1RwF2tb0sitQi7vS7/W5/AvIjpDnmyGwTLkb6N5hzkX5kTmwewNIcCsvGtlYQxJwTjJ9
         37jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781495725; x=1782100525;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V5iYWamYBGi2g8X7XD8Ib5OYdq2ngK3owfPK32tRL48=;
        b=c9VMVmoqexFiKwytGs2aQenYZgbt9+z77FgKqKHlrW7vMGhGpflHPlUjjhcK9/hj/s
         RtMe6iCUVbkMqBTW3bMPTVG8a10n3rgxBW3c7CAgWKvFxATDjtncf83R/CGWttbFK4iO
         njC0ufR/eVmy5vZnKpGS3SY8VNzY+rbJZ/+ONkwVm1jAOUioofhvyGHbOglSQU9e8Qf7
         jRyd8rAlngxZXNIIzHgAM63xM9jtOL15z8HOBItbSJn4Ze0JWf7WYu3oWGP2geJGYBMZ
         utwDX/bpmqIWlNx9Qgx3Ls/2BDQ9QsWFPUhn39lBuAQtJiKcX8IqCcSIaUmCVb1zUxEt
         Ysjg==
X-Forwarded-Encrypted: i=1; AFNElJ/vzuQYozHcgTvvi82h7VVF4dtk59yfk9k+Wlr2ZnfUhDTu/nX6OXuuN/ZmR4mO08EC/H8lfyd66Nrwk8Lb@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ6dk8uxjTvDzO28wuqCznN+7qKJktNSat7+36MQQm1fHZzsM0
	ZTIlP6E7vuUPAwYf+zyLnRvFby3BsnP31lJxI0m9ijrvxDN2FmqrZMP8gcaiIJXiEQAQfwQNoqf
	ULUFg43kwr9JtPl6AzDnSwgTu98vYiUAeVXq6i/h4kXWZ6ySCymXfUa8s8p1ybqfb0NL8
X-Gm-Gg: Acq92OFLlTh1Tc1O8JPAbFrIzfPt6fJgKSjciYAx1mX+Sa3x2+4R26nTHGSX9CAVHVA
	rgLyBiSRYv5x5gFy4O3zSr7AGdbOsH++nIb9lQsC4EV8Gj1AqoruEGhHa8Uf1tUjpWUuzE08pmT
	y/klnjoaK0HfA+PD0wLZB487IkFYbdIwfCgwpdrKRAOzhHMkO8CaxAyCcGDIrMfXJvkR6eh7xRF
	gOcNBSSudN+Xn7tBM/14878HzQVVDckc+d3ikqLV4q4fgTlst9y5cTtYrTZ44giS+VCZa3M8X5g
	jHW35SwAo3RUe1I/TfB3PJcYlEZdOJZLlnLkLGFHfiMo2sHXw2kaCjFvTeDuu/mnGwI81+iOvwh
	NF6eYsOHQ6G1d9/h1f3cgK/lqT77Va+ch6n4=
X-Received: by 2002:a05:6a00:23c5:b0:842:6004:3fbe with SMTP id d2e1a72fcca58-844e1a28e6fmr10448193b3a.25.1781495725003;
        Sun, 14 Jun 2026 20:55:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:23c5:b0:842:6004:3fbe with SMTP id d2e1a72fcca58-844e1a28e6fmr10448182b3a.25.1781495724608;
        Sun, 14 Jun 2026 20:55:24 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b05921bsm8482573b3a.59.2026.06.14.20.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 20:55:24 -0700 (PDT)
Date: Mon, 15 Jun 2026 09:25:16 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC 7/9] arm64: dts: qcom: shikra-cqm-evk: Enable
 ethernet0
Message-ID: <ai93pMA6MQ2zBv6q@oss.qualcomm.com>
References: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
 <20260612-shikra_ethernet-v1-7-f0f4a1d19929@oss.qualcomm.com>
 <6fde35ce-52dd-4679-9952-728b6553b843@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6fde35ce-52dd-4679-9952-728b6553b843@lunn.ch>
X-Proofpoint-ORIG-GUID: 66pq16RR1X8uWQgxJlkAfvPrM_PqDdii
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDAzNyBTYWx0ZWRfXx/OIyCTXwAER
 Jl6eXYTymCaMrQFTaJtMHvQ2bd2L44DtTY1uwh1SxjP9rlbd+bXzBri2lEsifI0H6YCv44T0euU
 vL95V2M1Kk3mQc0oQ3wA4zu1kgdBBTo=
X-Proofpoint-GUID: 66pq16RR1X8uWQgxJlkAfvPrM_PqDdii
X-Authority-Analysis: v=2.4 cv=EbP4hvmC c=1 sm=1 tr=0 ts=6a2f77ae cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=HuS8l_LH735D3i-wPbwA:9 a=CjuIK1q_8ugA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDAzNyBTYWx0ZWRfX4KDZy7V32HRE
 +ySoERNmDEeyRMuGRVnVYBG9oTPEoPhNNziy/CPsGBzuHQ76XPoqWjZh3HggenXmzR+XmwEqIno
 mOmFcjd7I/XZGlVPn13EYEPPJrmiI2vH3hPZVkTMBR71sfAITMinD019fRxxKZFw+3/ncqglity
 1Tg5VtxfJPWKBcv6CquFcGvkCouZa8KgaG5xgkoUml/nlUrgfXqsxWUc3Z3g8KBuBUK1attCAIy
 LwEUb3HUxqpsKQp8oYikw1fuGSXCDBkopkq35z8svFI+bIMS3Jlx7mCKSJ8I3L7205/274MWKeP
 W/qfc+TxMoug4GGCjomLw/mrvVucWFbCa+LtGVZ14OCnzJOldb6g2MP6XC0fRFBkGMnx2PHsc2V
 sK9iv1PYtLBVWOMNsIH8Lo7dpDFf3XcDYtnfnuCTXIlZ6qC7fuAZidq03j1Y8YEQrFo8mh+ciZb
 vf/1qLx7c0/+tjoGUsQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150037
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com,armlinux.org.uk,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-113066-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux@armlinux.org.uk,m:linux-arm-msm@vger.kernel.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER(0.00)[mohd.anwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohd.anwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 239896832B6

On Thu, Jun 11, 2026 at 10:58:39PM +0200, Andrew Lunn wrote:
> > +		ethphy0: ethernet-phy@7 {
> > +			compatible = "ethernet-phy-ieee802.3-c22";
> > +			reg = <7>;
> > +			reset-gpios = <&tlmm 135 GPIO_ACTIVE_LOW>;
> > +			reset-assert-us = <10000>;
> > +			reset-deassert-us = <50000>;
> > +			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
> > +			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
> 
> Are these two needed? It should default to 2ns, since that is what the
> RGMII standard says the delay should be.
> 
That is true, I will remove these in v2.

	Ayaan

