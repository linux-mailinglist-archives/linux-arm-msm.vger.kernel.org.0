Return-Path: <linux-arm-msm+bounces-113294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id u5C4A7OVMGrtUgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 02:15:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 905D168ADB7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 02:15:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="bfKiIQV/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hlETygYr;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113294-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113294-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 72B90301601C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 00:15:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 126371DA0E1;
	Tue, 16 Jun 2026 00:15:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13231D7995
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:15:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781568937; cv=none; b=tuPcfjEQ8mUU07wv0IRJRuz/Ip8yP0Eb4BW+tthFtuNtDZmKHJpGxPKnOWtJ7yJGe5pPJujXeiUJDb3BvZgZUL71UCY815lAFLrSznWDxLahGbp5CG8yQmMlKkxOggocWdWXxs3/a6PJ1dtqe3135exyAsrSx5xLDvJ3P2/Agog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781568937; c=relaxed/simple;
	bh=4LX4ABWcbUH2m2TdeafXhUCS7wS8XQzjyw9xEZsVYjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=COk3yLmKSmsZ4QazHkVdF854BuF4BJdy5lsdOenhT2Fpr+kORtuDr3K5hPKMjpm7e5UIYcKvSuemFIrGhUGPmkOrid1hvE7buG02F0sP8Djk9/ij9X7HSXm7buFKMds5AF1UpcSxJ/kEC+SMrp2t8tya6HAtmMcaF2eZQS6zrok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bfKiIQV/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hlETygYr; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FJ2Ixg1245700
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:15:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lZ+6EGboMaGEvyXaahC9VusD
	si/sDukRozSGEB3PJfw=; b=bfKiIQV/z4nhCy1FLJQMtLjGA4/riUikrR3PAWJn
	OUI9dRs1qmPylnO0CjXfl/GODUKwQX3ztvTb1SqMnAAf+EXQNuvtfZTFvbN/zaud
	VxMe0/55xGeHFuzVn0mXkBf3BN/KfuSu+19a0YbjjEymvZwYLySmoLlIBV98nqWm
	7m3swlKeX/vCOeU2j+zRRMI8ORF9zd0HGNfpKoKsu0PFgt5c5viQReAZUzJ8WpeK
	+Q6QW4kEoaiX0YW1Ajm4Y3zsvidbbBxfTMEJoa5xl4AVKzirQzzh0Fd/sHfV/xM6
	Xhd9VTu/yaaCNSev+/qEsYwRyVFYMlxa5yxi2owpeZyLGw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etetf3p05-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:15:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9157ae36434so351102385a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 17:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781568934; x=1782173734; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lZ+6EGboMaGEvyXaahC9VusDsi/sDukRozSGEB3PJfw=;
        b=hlETygYrob2RdeE5t78eJ43FrhJzSoiCdbbQtGBl91GtrrRZto3STniVBYiPgTxqir
         LOS3pnEsb4Dc7G8thFRDmE/EPBidpCnyaxKoOJ+T9VnPXxhgIv/GBSeh4KPx6GpA8gNI
         w0kGciXsYrd/O4mXJgk2pti8Zi6XxUP5XLBpX2TqGgG2slrJUbU0+1S+yKhXqMiNPgbk
         U6P6DyFOCs1v2neSAq3Hn29wgd3OhGjRdnu4NOn9sg/NNjlZiAdUy+NoyHngyNGgINEQ
         Sf77ZhAsLY+Uy6PnAx+zzeoRvH2hh2ZBp+5ccBrlyVL+MWplTwoW7LUusa7tVsCgB5P9
         Suew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781568934; x=1782173734;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lZ+6EGboMaGEvyXaahC9VusDsi/sDukRozSGEB3PJfw=;
        b=ajdfKvG6RVFPZ4G8s66rbaLC+yi88ME0uFvsUsG3gyM6pxqdJIUgbWITf1UMnp0SAE
         zmhP/EOma+IoEFpcBRvWoFWxR20vLnX4hleWX6qoBjg6zoL4blYvsmaKykeJ2aO5gOjd
         BPssX1FjOm4DeFWyk4650HtvD/Qkp1fZrqQYNDSo1ba85lB9WAUOSgZzWhwO61KVgh94
         kASn07erVntTpN2uZ4lhdaLKM/lF0yEMVjm2UjnyHcAW5hA3ONy9nOM7kGlWNTB8XC4C
         aLg+8r9B3vadmWMIj25hvi9DTJLRq22nYgjRkkDQFsXSaIYod1ncWbpMTTEhBiSfWfhr
         efPA==
X-Forwarded-Encrypted: i=1; AFNElJ8v7tDUXqE8V6b6Fdoa0Bpv4237TglNajnHuM1evZQAfICM6G8qbT9Zey/JVqXcGGCRsBz4UQroLGLxG1Fv@vger.kernel.org
X-Gm-Message-State: AOJu0YyL13db9n0mFXtdpMz8o5f9EmRYp9TypmMSNln2PUkEH78p5hi6
	NASZuYeiMZ3QDKAri9fx1gxpNygiZSYDRnnK55FrbayecOsyG5JCVWlke2gBVhp5aGbxdM32gVo
	JrrvW/D3a2s50O6owITySO4bX8L2BfRZpScb46PNnhHAUE5l+W0aHt/N1NRgkfBbT3kWp
X-Gm-Gg: Acq92OH9o83LpRwGmK9P0TMiiwn3rkEjTBIDI6wBGrqBwhp3L4fyLp/UnzwyB7hiFpF
	Io30ynKoaE+c6gOPH8v3DPBBbcn6A8P5JNnEWdMht3LXGT5WHuYw753fkq2PJVFyngkd8rCe596
	juAbMY7FYTyokyvrfYdsyTmH/xGLizGBoe7mFwPeIH/UYWpDFP6PB7epcTLCzrcrMsahimeWHdg
	kya0iOLTbNuSrfrJhZ4/wOp5CkL/fVb+t+WUuCmZdMIHvjqAm+UFCmXWN4yWFbWEeXKAAMVp/Cc
	hReYIi/g83/a1bL7n9zXue6g+UfKg67gfBUAESDR6Pz9tPgO/KaiRIOgtPYiYbZyeLCotCcFHS3
	Xa/tY8x+jawY1kItsBemADqoMPNCXkoHb16JsmJFv5+zH1+bOVI1l9E3fuS69bEdDxWu0UKiMIA
	KWJzIp7Sn1a1O8JyP5szJ9tI0UakWXc/TYEb0=
X-Received: by 2002:a05:620a:8909:b0:8ee:eb50:4f51 with SMTP id af79cd13be357-917f1c50c74mr1984282085a.54.1781568934229;
        Mon, 15 Jun 2026 17:15:34 -0700 (PDT)
X-Received: by 2002:a05:620a:8909:b0:8ee:eb50:4f51 with SMTP id af79cd13be357-917f1c50c74mr1984276985a.54.1781568933700;
        Mon, 15 Jun 2026 17:15:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3995c191772sm2544161fa.21.2026.06.15.17.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:15:31 -0700 (PDT)
Date: Tue, 16 Jun 2026 03:15:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sc8180x-lenovo-flex-5g: Rename
 regulator nodes
Message-ID: <grnrkbu5oer4epkdvml7la3t2vveqlzkhwtkezunseubhq6f6d@og4rbbhoou5m>
References: <20260615-topic-8180_disp_power-v1-0-18d36b548c48@oss.qualcomm.com>
 <20260615-topic-8180_disp_power-v1-3-18d36b548c48@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615-topic-8180_disp_power-v1-3-18d36b548c48@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=adxRWxot c=1 sm=1 tr=0 ts=6a3095a6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=NKzW1n5FEafzfbm2N1cA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: Tvyp9dg9TzckthNojPg17AdEW83NH1F7
X-Proofpoint-ORIG-GUID: Tvyp9dg9TzckthNojPg17AdEW83NH1F7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDAwMCBTYWx0ZWRfX8ZkfDzsRygfJ
 ngHJlaPnEOgz8YBpsIldCldRXd1q2dgmRckG0M9UEiM17Qs+4rQnN0QrHgW024sWsvDGbUJT7ZT
 3wnaKrvQxuXOFX55atrfMpRaeXuYuy4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDAwMCBTYWx0ZWRfX0/XArx3u8Tlk
 XD1NJ/jISYFfa4YPjVMIGONjS9E2Ji+Zb4jpQxLqqkOsiJhPzaQ7eoQGDlRI7FnktDdzXkUF6I6
 VsR2OnpmocBgXhkJRBLkdT/82wPJQpy1TIQ+S/3kHNfZIuY+Zn9yphsgpfB253jwPT9KTW+kVOa
 adt5FO+5ybqJORoLRhcilGde6MnFr7MQh4j6RX0+eMalDAUWDjV3YA/4+eL6neP5iD3qQ6IR8TA
 btBjA2s/se7SrwtHtZ0oItTDxSJYGCU98969dozkLCdIwnEj4FRiCPUpu4iW0cnM7G56Vc2+imT
 yO4tP+D6K4OBkRkMUQP4pm9NnJNEx6yo/p+KHify5k7hLYWhIB6ZaNv0Hut7PogYt/FS3L+fFJO
 WKOty5jJ9jrBHptojSGrmLQiEW5Jr5JR2W0rldLPEdUbAivRHodrhdeYLMfdXNVPOccbFw+eWcN
 nTtz7FUfzhZqjSP3MBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160000
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113294-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,og4rbbhoou5m:mid];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:andersson@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 905D168ADB7

On Mon, Jun 15, 2026 at 04:22:06PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Align with the contemporary way of naming regulator nodes (regulator-
> prefix) in preparation for adding more of them.
> 
> Reorder the renamed entries to match the expectations of the DT coding
> style doc.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

