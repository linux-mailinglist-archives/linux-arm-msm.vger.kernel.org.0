Return-Path: <linux-arm-msm+bounces-110982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id y0OqAR8zIGr9yQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 15:58:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD4E638519
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 15:58:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bnMv+xfQ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HPOt61OM;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110982-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110982-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A70E0304BCF7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 13:52:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96EB7335091;
	Wed,  3 Jun 2026 13:52:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6496331A65
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 13:52:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780494735; cv=none; b=o9tLeD/FYE/tmC7rvx9wbsKzwmimkyWdYtYcOOHa3Nu8uUVxehyUMUIKBVdpApPPkV+UTG0x4JMLP+leMB0zy2T3T6qrvdGB2FI67c/8BXwN+kBfEKKmbJBIkekezPkB8oVYawEscxjjHuG7GpfqtRELxuE+SRvtd2BG8kynbzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780494735; c=relaxed/simple;
	bh=KMtEGmrA8m1N7KoJpVywfirfp33O1hFNJjUcBMTi9l8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yqk52DIbgr1c6gQf5Q4xj74P8PdrcIyQxSScyUyEPMVeIfxJl1vUomQ+SiW3z954MNdoscFVBHxZVCWAMJAC4alkZN3xIre9EWCWVcu/5EQ2EkraH2JsNYXv6K1MpMAzmwUBLBZ/Kud4GdR9FuXkPIod8BBoarfv8c8BY/g+n8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bnMv+xfQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HPOt61OM; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653CSlaC1946589
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 13:52:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LEAaW4KMsR0ywjUGKkykMwna
	d8EiVghRjvhmLV4s5e8=; b=bnMv+xfQYTdAjpRsy5U2bFaDDP+plpadUibJmKM9
	iTBQR/WkMLtJYmbIRQp3jQDdBq6bTHrH1I16D8yso18Wh7jMhaaB46ietSkWN+xG
	eF6HT0OJEMYRRodRl4BhDRW0x2lA5TTETyngkp2m+vFLpNHDm+j8n/T5m3qsUvwk
	i0RITu2DcEVLn7dViELM1BYwvjSYTXpr4TPTd/azCSmbI4s6c73qGPR+LTxQfEzK
	jC1ojnVxkNcAEoBPeevPTHYvP1BC68SaboT3HkJkIXTTa3UxhFoOlfioNEOijpqq
	cs3mZxWLGEUFH9nTYuQqcaHJLdseaM3zUhMPKTIACPBdQg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejabgjr4r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 13:52:13 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6cfb3463931so5063737137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 06:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780494732; x=1781099532; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LEAaW4KMsR0ywjUGKkykMwnad8EiVghRjvhmLV4s5e8=;
        b=HPOt61OMK3qXqQCODRrJtQ21U0QIcswCVnJoR/m8mUNoI+THbitM+/jH181qqMpMDc
         PEs+N7tpi1v4DMTqc8IgFTezsC14u7V5zL1lPsujjmSMzpk5T9ttSpITBrTHra1XvPFa
         Lmfr6CGBv8QA2PCMYkc4QYgwL+OBUoiVqhJIcCGFS23XNHwMHZpFRQDY4JyXMX6g4NYs
         DEsevGxAFGCmPGZj0fzTsc+BQe9COwLk9YNpZexY5d0m7M+GpBVAICKd6o7Na2+h+Kz6
         xXCzyVa8td2zzNIRSaoe9eaQs+HePLFBHx6Sj6LfwfsWAU6ixAvRGXIcrnbdrFwg5d1z
         bw+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780494732; x=1781099532;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LEAaW4KMsR0ywjUGKkykMwnad8EiVghRjvhmLV4s5e8=;
        b=m/veriBUwK0aeJ6X/wEI87NMiQWM7IwmZsNt0ZRQKpbt7fF2io3CDYIXAF5jHEk2Vd
         jGhssB7qF5UrrX3C78F3HbxKX5uflSYXt5oJ15A305ngXSgh7QoYIwACuv1qklJyX/bB
         ifkQsJ0Vmb38qMUkeEsb5pG4afOUW3RN0l7HUDtnnrD3Liuq+BrgP+nxWB6dKPjuaHfz
         PK/mMy1NPdxqymLRSOaC/HOeunwuNWCLdyt4LKxEKAeM0dD1+WKkHQW/IfkCAcnouNCU
         4GNOJkMy7eOs5sEBYuNP06m0OdN0odZyYgW6iyNhNsJT1+RDS6XPJKoRT8dj3tM8ZJhB
         ftpg==
X-Forwarded-Encrypted: i=1; AFNElJ9r3P3Mliny+YybzgxcXVaAiSRBW3vR1JK0y+kQOhHlZ0Cqw8bR0S3AWcQ4iYUfLKRkn1tlpvIijfYlwmSi@vger.kernel.org
X-Gm-Message-State: AOJu0YySIkylaHVgb7Tt0Nw6BSGZPISapJ16wpPj2872Oo28u/1oJHB9
	pXbUECyXkJIxTcd0jL8KXl38pnVOCCqi7bgI12nxnxzJ6n/8IJPO1ZieYuAOdcf4NQB8mtTKgng
	XdpfuRop36l+uRZpY/L5oAdFnStPZsm9XN37uN5JpuqlHihfsZnCn0TFH3M3O46CWD8Z+
X-Gm-Gg: Acq92OGFsUgOG9SqkdH6vFehGtTlt4BzxjN10Rc+gNrtjDusf36KHul9FoMa0Gd+D55
	yUTMJ7FOGLffTlAKdXRIIOannmCpHNjR3RXCZCyFQbC+rhtEIgURZJZppmVNjPdHuvKn9UenDfr
	qxOx5BacQhBeiyPnjCPU0rMyYa6wjqNMG3zH5Nv5G7zzx/V/JuWZNfLUk6Qe61ShfT8zi3CucCL
	ACPXou1DcwvFCaot2rZxwvGZigGDD3PTgtJzSjOVjQShXyr0u9OyocLoj7CWtqt2gA5CC+QEx7Z
	2K1MlBHVltwyb73DHxatr8KIZuFJol8Tu3/ELNIZF7XAMomdmscWhQtpiygKnwzExOQW09BIE5w
	r/hsTOlnDI6gFX5m6ICPpLlBQ4j1Aqbln2XSJ3OprbchhGtqcM8kXtn67UFA2+Dx5JKz4tYNfuY
	qUXXNLXmwzEfKkuxhlECBSZkBdAa+K+w1ImUasQjzppRecrQ==
X-Received: by 2002:a05:6102:5091:b0:6c5:d55d:c096 with SMTP id ada2fe7eead31-6ec45900816mr1645181137.16.1780494732061;
        Wed, 03 Jun 2026 06:52:12 -0700 (PDT)
X-Received: by 2002:a05:6102:5091:b0:6c5:d55d:c096 with SMTP id ada2fe7eead31-6ec45900816mr1645158137.16.1780494731608;
        Wed, 03 Jun 2026 06:52:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2ed925sm9320831fa.39.2026.06.03.06.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:52:10 -0700 (PDT)
Date: Wed, 3 Jun 2026 16:52:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: george.moussalem@outlook.com
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 3/4] arm64: qcom: ipq5018: Add GEPHY RX and TX clocks
Message-ID: <66sew7qesxu5nrhtol32jvtc2et2wryypvhx4ytdebqwcopca2@xaryrll542yu>
References: <20260602-ipq5018-gephy-clocks-v2-0-65a1f1d881f3@outlook.com>
 <20260602-ipq5018-gephy-clocks-v2-3-65a1f1d881f3@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602-ipq5018-gephy-clocks-v2-3-65a1f1d881f3@outlook.com>
X-Authority-Analysis: v=2.4 cv=R6sz39RX c=1 sm=1 tr=0 ts=6a20318d cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=UqCG9HQmAAAA:8
 a=EUspDBNiAAAA:8 a=5nzw82lfuaBeqxAF_j4A:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: s-i2Y7AeHgZiJqtqQXOPGvrgWWaz54Ph
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEzMyBTYWx0ZWRfX8kJA83TtMGLR
 BTDOcZn0CCIZ//p93WHRHu70PhxI3fnlWnFiljodWfBkozKhPbFLZZcZwH3CMqIZ1ILL0b1plVn
 l0ViGlp1MQQw4YNzOVONzc60xQEPKfJFt0GvPxYgA2XLu/U9AW0jH4EoZ/I2C2zHTdBjzPmUAqD
 B2+XdV+4Hcw8XVU/RbnkXw+tsodKCwHL422rBN5yV1n87vJOpO7vmrRNJNob9Q4mdVsgNymF7qy
 thneLNTfWJ/1QakBDB/axdcRH8r5Qs1Z8D/Pe2RDlFuZgtiRFFPfUEbAeAuLLa3IFmudyjvPX9x
 guzd9VMh/2cShIIQ7OUpp18MKpX/X11QNG/5HbJCW52tWG1JeZpSFu0kNG0MOOnfSnnarTSLM34
 8KO0dTgBcTjEdeOVii24eeAfT3+MQPTFUlu4O4oIgUNJ6spTj7+Qj8PIc2xV85tqvXQZvt0RFrL
 ser+Zg9VWL19a5f46YQ==
X-Proofpoint-ORIG-GUID: s-i2Y7AeHgZiJqtqQXOPGvrgWWaz54Ph
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030133
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110982-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,outlook.com:email];
	FREEMAIL_TO(0.00)[outlook.com];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:george.moussalem@outlook.com,m:andrew@lunn.ch,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:f.fainelli@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:ffainelli@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[lunn.ch,gmail.com,armlinux.org.uk,davemloft.net,google.com,kernel.org,redhat.com,vger.kernel.org,oss.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EDD4E638519

On Tue, Jun 02, 2026 at 10:50:39AM +0400, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Add RX and TX clocks for the IPQ5018 GEPHY to enable the datapath.
> 
> Fixes: f5f2b835e316 ("arm64: dts: qcom: ipq5018: Add GE PHY to internal mdio bus")
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5018.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

