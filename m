Return-Path: <linux-arm-msm+bounces-98268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEx5MTuouWkhLwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 20:15:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C3F2B16A2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 20:15:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 78156305A227
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 19:15:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35C2A3F880C;
	Tue, 17 Mar 2026 19:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UoPr81ov";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XIEOM1Kw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECADF3F8815
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 19:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773774900; cv=none; b=ooDyW93tHTi29hVvPvcqHvbl/WnFSBVRmjwGDSGq51UXRXRQATFNR9CqE8QSywQ4tbw0fZ2NLBbxgkh0xipHdFjLFVTmpK/j3iUCCnPOIK2F0H2JPdxUFeb0GIkwtC0a6/lnhOcVIebVZYrkhPgg8cEnMYL9c8vaaM/GlqPOWOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773774900; c=relaxed/simple;
	bh=O0GbmyNHI8hlFPn6EqP7ekN8af0Tom1OLfEh8XTAQfk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fu57PaBhpg/1kznqIpWkr+iazIvVCTRBrwNR9Tu/lOTVxnguhioGoO1F45f8iFcgQ42DAM6L0qbjzjghgJc9b0G/9Vfabp2z1l/JxD4fsQk7FPmhycBDZFesdHKe1tfy/mB3mmz31XOeVpZp04VEsmhAf6gZD4xYFLOVlm3UYwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UoPr81ov; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XIEOM1Kw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HIJOCX1895239
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 19:14:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bNOPxGj1B629A2kXBCZFXpIE
	6RUa9mVOlSveDz+QzEg=; b=UoPr81ovRoDkAFTWzo7563wZ4oonnyI3+es9Ug2j
	ZCVX5sHVYlEvt8bmTE8fpaaGukpHHOG03NhnOyxQwMEhWwe0YrfZinhwa61uDx9T
	/7nhSLyWh5cBejF3eyuzIIJsRnuWyYX3NkGIVce9q+plXikxh1uzAICLg0QBb37W
	6ah4T5/mLYeZjHT7uQhvX3H+tDUWxay2LhnHKi9YGa/cHpLTRyzQoFDQzfLWxt3U
	WiZroIlUmQH+5eLD0LOtmchbDK87xGnJWQdc0ZzHKJhtk58On24cc2+eR22yoMn3
	plomP5Zee/FYswztxjUbmCyA8NTb0OkVAXvfBinBjo0xwQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy6d6hpe5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 19:14:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb706313beso151272785a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 12:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773774897; x=1774379697; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bNOPxGj1B629A2kXBCZFXpIE6RUa9mVOlSveDz+QzEg=;
        b=XIEOM1KwbNTGYJwh4KdYgj0PMQ6uBymXE8DXL2s8YxPuqgV1elNwR60l0HXQwCQ54x
         TaFA8TlsWTH09eCvYUqL9G1OHYyiexDaIT+U2dKmUojCI0ClsqHc6TL2wKOTGq0FqssL
         Z4aXMFdohYUWMBAANiBj18IHc2+jvGx06bxOUtQof9VTURcw0aCat4w4nS3El8lyQEXX
         4uufuf+MbT+ya1a2uMneTBZOc4neCmJCPrHNxwWFtHNnON50P+WbEVH1gH+OeLtncf11
         UougG6+ZPn1Nzid1yVFj8P8ADyFuPeTphCAf6UVVzrId1jZ6YIZMnrJOevbEPrUilWkf
         UJFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773774897; x=1774379697;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bNOPxGj1B629A2kXBCZFXpIE6RUa9mVOlSveDz+QzEg=;
        b=OHzTjuKC308TYcnMdxYzpsqos4w8e6/BsA84NPmzovikO6p6xQtcdjC4ZK9tuC8A67
         +w/4gfbd/PL/4QGWrhjmOippPeSvNZ0N+P4jsBjyPUSrYy/sGsEjm0AVl8MBPId2UJb/
         smkS4J6/mxV0WGYqhqcujwhFcMuokUStbc/xcCuOGo4pSI1Z/bNYyuUtqvNkRG2Q6ZbA
         9cBL/hrkTdVUQqitmoMJDpAv6BD8tmAVbjWK2VxiSyvHU1qpXpDR2iS+1AU/z9khLPwc
         E6ld0KXU5U4q1oLM303/MDRmhlhU1dK3osC4Po7T9Gp+3P/uAvku9M7Asn59LPFOUsCo
         0R2A==
X-Forwarded-Encrypted: i=1; AJvYcCXBbMBu3LxTEGXvBrgRovbYxQ+FPpEdl75Pa66Rj0B5p2EMG9uHp/peLRftK1vqEYeyCfXm+J3YuzbE727y@vger.kernel.org
X-Gm-Message-State: AOJu0YwtgWYfRGrcO8VTn5AYoOvhgsYnzMTZ7klK+u/eiBgGXehnyIty
	mau5c3MOs5EPzoAYNlrRFgVQOm7KGCA4XtomgMrfstH3LTFQt4sMzi4A2tSw560VXoF1fRGOEz+
	CN6tcTykAOvyUCyUeOAxFupFnN5ToMzHmoIjsrJIIbKO4d+PLGLVKFITQNdNhSwXl6usP
X-Gm-Gg: ATEYQzwZeYErLHEQIaUFkwS3yGVQghbOE61ewnVves2ejIYFzuVT8x+p475WhA+B9un
	YP9fXya8ouJxtrg8zc+jwJ1F/uft66gKl3QNBH9QFEOfZRg7BIxRu8GS0/jfYonNXeWqorPp20k
	DKaLrkTpnwOjvS1HK9Tcohh6tvhE8JHn71Y17JUWpieGuzAi/9HT5Kl9UbR5uAxMkEGugnX+JQc
	HjySKae73+9Je7jvKhjbsxGZ2cWqfKGZdh+4d9su9Hff7RJvCKhnqKdkpXbIZPq64HwBl9ju6RA
	lQbQ+diP0AvQ8E6sfi5qZ77t7PE5xVn3Yd4cWNzVQpOAb4/LNazy8vp4lnGfmN8Mm4JZKjJ/uMH
	7crV03G6ajW/Fe9EN33ja3xnFuiemu1yazg==
X-Received: by 2002:a05:620a:4708:b0:8cd:b2d8:ec7 with SMTP id af79cd13be357-8cfad268fb8mr109783685a.23.1773774897059;
        Tue, 17 Mar 2026 12:14:57 -0700 (PDT)
X-Received: by 2002:a05:620a:4708:b0:8cd:b2d8:ec7 with SMTP id af79cd13be357-8cfad268fb8mr109777185a.23.1773774896370;
        Tue, 17 Mar 2026 12:14:56 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b5189964esm1281455f8f.29.2026.03.17.12.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 12:14:55 -0700 (PDT)
Date: Tue, 17 Mar 2026 21:14:53 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: hamoa: Fix OPP tables for all
 DisplayPort controllers
Message-ID: <viub5zy2ni7hzutaxxsrc3yxjevemomxrnsxhv75o2higjlh5n@2mf6bowxrqkn>
References: <20260309-hamoa-fix-dp3-opp-table-v1-1-1a8141d71f9f@oss.qualcomm.com>
 <2f4e4cc7-2600-482e-88d9-d4b20d328a72@oss.qualcomm.com>
 <drcot4oxpea5lnpa5htrrl2n6tcc4ocxmb5vsho3ocouvajwlo@6ueabivtjy4h>
 <ed3fdccf-d8b5-4f57-871c-8a9cb8676606@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed3fdccf-d8b5-4f57-871c-8a9cb8676606@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDE2OSBTYWx0ZWRfX6IYov71CyDWM
 5Rv7taPUvXKlbR5L7mcVjq6RQykiczlSnAIm1/OzKjJd7A+ddB30tiZFHQVuYPn0xsVCryaz7OB
 tgav0Eca3wbWvdLEjcB8eMYSbVI7/TBJQPv/vBwxFgap/plEE7X89NneAJt9ie4ACu3Iml+Xp7u
 MmP0ri8GDz2Grwb27PYQpEu4dXAMemFNMdt5HO11lljlJR5TrTtGbBhSyo6vF7OWPfT330nMIJT
 OjAjruNwtUiuj2GeUU/xQJ1K00t+73+grOZc3Jc2x4zjJx1Af7n2wwEHUy0QdL5PU8aokf+yUsP
 XWBm9ZMp/R3zW1KGKkvMk1ZPAtnBzn3CcBDXI/kM8/FRTcUfPjX4B1R1fpwREnQy0gipBXKnnSz
 AzJSH9hmMtI0qEpBWTlydgRGiU7DJpY6umqldm7kR5EdLbW31uEF65zy8JLGgxJGOTiqLWHPrm0
 SzDxa5ct2thTY/DMdAg==
X-Proofpoint-GUID: ttkqO7GqB7S9R30rvagvrYFD_ibD-1Sm
X-Authority-Analysis: v=2.4 cv=IqMTsb/g c=1 sm=1 tr=0 ts=69b9a832 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=hLSxji5Pbl0OwNBPb8oA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: ttkqO7GqB7S9R30rvagvrYFD_ibD-1Sm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_04,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 malwarescore=0 phishscore=0 impostorscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170169
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98268-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 32C3F2B16A2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-03-17 16:06:48, Konrad Dybcio wrote:
> On 3/13/26 6:39 PM, Dmitry Baryshkov wrote:
> > On Tue, Mar 10, 2026 at 11:36:26AM +0100, Konrad Dybcio wrote:
> >> On 3/9/26 3:44 PM, Abel Vesa wrote:
> >>> According to internal documentation, the corners specific for each rate
> >>> from the DP link clock are:
> >>>  - LOWSVS_D1 -> 19.2 MHz
> >>>  - LOWSVS    -> 270 MHz
> >>>  - SVS       -> 540 MHz (594 MHz in case of DP3)
> >>
> >> This discrepancy sounds a little odd.. can we get some confirmation
> >> that it's intended and not an internal copypasta? (+Jagadeesh, Taniya)
> >> FWIW DP3 is not USB4- or MST-capable so it may as well be
> > 
> > DP3 link_clock is sourced from the eDP PHY. I assume there might some 
> > 
> >>
> >>>  - SVS_L1    -> 594 MHz
> >>>  - NOM       -> 810 MHz
> >>>  - NOM_L1    -> 810 MHz
> >>>  - TURBO     -> 810 MHz
> >>>
> >>> So fix all tables for each of the four controllers according to the
> >>> documentation.
> >>
> >> It sounds like a good move to instead keep only a single table for
> >> DP012 and a separate one for DP3 if it's really different
> 
> Please do this and resend

Will do.

