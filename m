Return-Path: <linux-arm-msm+bounces-96338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKuwCEoer2neOAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 20:23:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C057E23FBDD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 20:23:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E3179303748B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 19:19:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D935D361DCF;
	Mon,  9 Mar 2026 19:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VZ59geVV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EijIl+2y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398C13603D7
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 19:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773083993; cv=none; b=K/0DTyZ+yaMWay62nY7xSkrmxBsUnOIkG5F5KWj4VT80ilp98phqq8kmA24vO0rccyojCok03BANPLkDCkcZQyhRjNMB+GwyOroj7JdcpywbNE9k+ygMppWEXoUkEXt8mZJ1GQFvhH7WtzbLz7Hin6hPZHFgfHE9oz8GsniCgUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773083993; c=relaxed/simple;
	bh=jhU6kwVb7AGeIWqrHMoz5uRpTNsNQk0Nb3huxwwfwmw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K3obqRTUAE2qqR0VL+lrD7bzZk5Fx5yiEUi0QCyNJQDtxmF9bEmNPv6LZSxi2S+HP7glbzDHtUJbqdOnJ6ZNXwAVt2YrKMVCHerDDrwfnQuJGZjQmdNB/Lghh00eHxMAI0x5+3YmaVmAE+iRnixh4ScX/kz+w5VrHs8E3xl8ieg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VZ59geVV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EijIl+2y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HC0WI2427877
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 19:19:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	01PiEFiVdbkTxdM86ZdhmN4JAMNGcg+sNpQ3C7imXXE=; b=VZ59geVVAwdNWXtE
	Sa/JuwzIL8Tp8cT5720ecSUmXIF004OBOoUyDz5N3VVTyQnOt7X8O47D2ppZFbFN
	J/CgVESGxjkRriNwkbwOZ4mvMPAj7AVgOxJpEWhcJ56n8oy9dtJodNiLwhVjkqTb
	tjgYCt8NKXens8D/RlSDhZhTcb5V3EIdDRNQSJgeWf1fes6KT783vleKECddwpLL
	XlAVhHnO7S0hqsq9bFO7o+4i5ldGvYSBUxpRYAwUmvR3dKQagYUJtPPCaRz4kgvn
	k7HAMe7RNMd1lR1mpj72TyAvbzh4j71NEVNK+QuhUrdMytWbM9eef2V90EuF88Tq
	tlc57Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct1ekrpss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 19:19:50 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-899ef673d82so165325796d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 12:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773083989; x=1773688789; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=01PiEFiVdbkTxdM86ZdhmN4JAMNGcg+sNpQ3C7imXXE=;
        b=EijIl+2y/saontIpl9E402Jr57YD3L1GhAl9NonkT/Ejr7lzMnX3YD8iZb7qpZ2uIX
         K0x6qGO67sqZ2qSLQI24/eDQ95EwsAAsnUehYIAQDykUe0pYT/HIRQNiNKBUD13KO8Yz
         s8cWdf2lDNauZyO2OAyYC6h0yMh18e7YJ6Yfj/w9nrQ9PKuF6GMgmRsF/hSf58FBzpOK
         6od/DyTCubEs4hORjLWR/KQHgo685CkbS+0bc4ZotYn/DKxSssvWpMl9951NsH9aIiG1
         5N27J45mBg8dVXwK+t6Mo2A4MEfXRrzcLdBglw88WByAoaX91BasTF/MQjZZ+mj1khRk
         OLYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773083989; x=1773688789;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=01PiEFiVdbkTxdM86ZdhmN4JAMNGcg+sNpQ3C7imXXE=;
        b=lMRw1u7o3FlFk+4M6xf/Fz/h7DSc+2e8Mnb3ZHrGPuvvQbLA2eLDdPlvzlPLa5INfa
         2ADTYkEDKMzr4HHFZ6JJKwQZm8FSTtryMPRuXHwgNtt6lEkrFfrj7pg9qtwiejfpd0uf
         iqBOICyXZBYmRqS88wJNJ51iprtznJRqGgdR/02E1hPlmKhIKXEkxE8kaJ/nwfnWam8S
         HjkRvluJfUDqElLIk0oiXKAufLWU/TvzGrv3U7g3oX+Q8Es1cbpH7h9uzf+Om7U9cGU2
         2LdIbSIAHu/GzAMs0ic+/Ax0KskezqvJgJ2HbWXtgim6tkB7ieZEtiRIXTJr+wXyfW09
         4QiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrgLxIqfvRJkKZSS4UHE2uSUwIeOo06e0V98NLMk1cbxdfyomUF/AwSL3Pv/fN1JaGuFiyNUlknNi+NV5/@vger.kernel.org
X-Gm-Message-State: AOJu0YxRBWvOPNkUHbL26aTWpQJO0XJLZycIo1Els0EEC6YJ1iIXg3DS
	7iJQQbr/7qgkwNdHWPFfcP44VmCMBw9SujoUVvVdjI4ZkfiNhpp1n2WmPzQ3W38CKFX8DopOcIC
	dyUU6GXoqAnh1K1l+iHB8DlwBxLySsx+T12KmhhyEliQ0dsPgC8NegM7lq5fh6GYhvRJ5
X-Gm-Gg: ATEYQzxRxZ7gPhQgALcjPKqbzdkZL6Gai+iBQ0cWKZgL8jvw0yiSrThJTRivSO0Chz1
	1m6aRKwZT8SEX5gNs79CXwsC+g3vmAU4L349ttDTNYBQkTGTBR3UVd0fKvwP0FG+U+TEYb9onnD
	yt6zcA+czjlFCy8os352gVHfaKdCs06QHDZgZ/UA5vZyrULA3IKfZYXR1vgIZXCerb+oaKBUMIZ
	T/IWhp2+BSFH2I9RsWUX0vWYweZ6MBqBIoxWv6eraumIMZlOHjAYOjA6BmwP7L5LE5wkehywANJ
	ocvxfQppqmET9507EzJvIIQg0wF7BrXSstAKo4cZua9KduMNlLu+XT3iVqUtmvirDpruHDAq/X4
	tmgf+IsdrHmNg9Q7yp48T2WT+CRAAASJETJJ8cTRyI9Pc1TTum6H2Ulrryf6E4e0R1NV5yIFmFF
	rMHfSNTpp5pPMvMML6DflG4gzstD438s/5XV0=
X-Received: by 2002:a05:620a:4694:b0:8cd:8635:c03e with SMTP id af79cd13be357-8cd8635c42amr611777585a.18.1773083989226;
        Mon, 09 Mar 2026 12:19:49 -0700 (PDT)
X-Received: by 2002:a05:620a:4694:b0:8cd:8635:c03e with SMTP id af79cd13be357-8cd8635c42amr611772785a.18.1773083988527;
        Mon, 09 Mar 2026 12:19:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d02b7f0sm2277794e87.31.2026.03.09.12.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 12:19:47 -0700 (PDT)
Date: Mon, 9 Mar 2026 21:19:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        prahlad.valluru@oss.qualcomm.com,
        Prahlad Valluru <vvalluru@qti.qualcomm.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: monaco: add lt8713sx bridge
 with displayport
Message-ID: <i6cdhcdj7f3lbfvu2lvakbir7ovds3yfqyod5wceiedjqrlxxo@5gntl3peqz5b>
References: <20251228-lt8713sx-bridge-linux-for-next-v3-0-3f77ad84d7d1@oss.qualcomm.com>
 <20251228-lt8713sx-bridge-linux-for-next-v3-1-3f77ad84d7d1@oss.qualcomm.com>
 <z3y6wb6irac2ef3f55roy66wzyufel4vannfbynoivzgl2cuob@um5eomgvt5uc>
 <aZo/NRg3IxdyKZ6I@hu-vishsain-blr.qualcomm.com>
 <wvjfla4rk2qxzayloov6ofna73kl22nls2a6h5uzvap4kasfh2@nqvpdsassfcx>
 <aa6OGbZjT2SdTxJL@hu-vishsain-blr.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aa6OGbZjT2SdTxJL@hu-vishsain-blr.qualcomm.com>
X-Proofpoint-GUID: dwitENBWMLEhmby3U7daaXK5hOiXuTA_
X-Proofpoint-ORIG-GUID: dwitENBWMLEhmby3U7daaXK5hOiXuTA_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE3MiBTYWx0ZWRfX1cJ6pOwT+t/J
 DBw/4TlZ+fSA9PPUpnZZj8cjUAetzimp3BV1jUEx5llTkdGDbYyDN4JTLYsl2s5Cugz/AR4mwU0
 X1h4u02kPYsnvLMzG4aDcCCUCi67u1+PV3N1q/eWxghooxyfDf8ZVj7JsPNPxaWAkOxA71UFu2U
 oN83762em6LOVYDDFNuDnYFDNhAWEE7zY5VbmqziABB1mYfnAxZoh+8VSGzwSPMsATAVz307zJR
 Wb4v5dzvYXeUbZJ0TbcbqfWgsrtlMfylM4nIYMaD5PPHLY1dEBFxS5jHvfsB/iOCISx5v31Dh9E
 2bIopiyenTp+szEvOOYAiRtZm1rrY35o31rK8TgVBMhdRaca9ZXziZXmIadDv0H20aoGjT4jN0E
 OOQmk8wC/BzQWO2SFwNmuc4140sP6V4gng2JIKf3/lQAwYS8YIDSHNa1Lg1lA1Iv4pUx5D33OcH
 g2SknDPie8fechPkn8A==
X-Authority-Analysis: v=2.4 cv=eIEeTXp1 c=1 sm=1 tr=0 ts=69af1d56 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=0qI5wC17y978S6CmwcgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090172
X-Rspamd-Queue-Id: C057E23FBDD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96338-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 02:38:41PM +0530, Vishnu Saini wrote:
> On Sun, Feb 22, 2026 at 09:16:54PM +0200, Dmitry Baryshkov wrote:
> > On Sun, Feb 22, 2026 at 04:56:45AM +0530, Vishnu Saini wrote:
> > > On Sun, Dec 28, 2025 at 05:49:30PM +0200, Dmitry Baryshkov wrote:
> > > > On Sun, Dec 28, 2025 at 07:10:38PM +0530, Vishnu Saini wrote:
> > > > > Monaco-evk has LT8713sx which act as DP to 3 DP output
> > > > > converter. Edp PHY from monaco soc is connected to lt8713sx
> > > > > as input and output of lt8713sx is connected to 3 mini DP ports.
> > > > > 
> > > > > Two ports are available in mainboard and one port
> > > > > is available on Mezz board.
> > > > > 
> > > > > lt8713sx is connected to soc over i2c0 and with reset gpio
> > > > > connected to pin6 of ioexpander5.
> > > > > 
> > > > > Enable the edp nodes from monaco and enable lontium lt8713sx
> > > > > bridge node.
> > > > > 
> > > > > Co-developed-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
> > > > > Signed-off-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
> > > > > Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> > > > > ---
> > > > >  arch/arm64/boot/dts/qcom/monaco-evk.dts | 89 +++++++++++++++++++++++++++++++++
> > > > >  arch/arm64/boot/dts/qcom/monaco.dtsi    |  6 +++
> > > > >  2 files changed, 95 insertions(+)
> > > > > 
> > > > > +
> > > > > +	status = "okay";
> > > > > +};
> > > > > +
> > > > > +&mdss_dp0_out {
> > > > > +	data-lanes = <0 1 2 3>;
> > > > > +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
> > > > > +	remote-endpoint = <&lt8713sx_dp_in>;
> > > > 
> > > > Does the bridge use DP signalling or does it use USB-C signalling here?
> > > > And even if it is DP signalling, it should be correctly described as
> > > > it uses signals coming from the QMP PHY. See how it's done for laptops
> > > > with DP-HDMI convertors.
> > > Yes, the LT8713SX is using native DP signalling, not USB‑C DP Alt‑Mode.
> > > The QMP DP PHY is already implicitly part of the mdss_dp0 pipeline,
> > > similar to other Qualcomm platforms where external DP bridges are connected. Because of that, I intentionally modeled the connection as:
> > > MDSS DP controller -> LT8713SX bridge
> > > This keeps the DT consistent with existing Qualcomm DP bridge descriptions, where the PHY is not represented as a separate graph endpoint unless there is external lane muxing or alternative signalling paths.
> > > If you feel strongly that the DT should explicitly model:
> > > MDSS DP controller -> QMP DP PHY → LT8713SX bridge
> > > I can update the graph accordingly. Otherwise, please let me know if documenting this more clearly in the binding or commit message would be sufficient.
> > 
> > Please check how (and why) other boards handle the similar usecase of
> > DP-to-HDMI bridges. To put it short, in your DT there is no notion that
> > it is a native DP rather than USB-C signalling.
> 
> Sorry i couldn't find any good reference for DP-HDMI bridges to check signaling. I checked these
> DP-HDMI bridges PS175, PS176, PS186, PS195, PS196, RTD2171, RTD2142, TI DP159, VM5200 but none of them 
> wire DT graph endpoints, Please let me know if there are any specific DP-HDMI bridge you are referring to.
> 
> I looked for other references where USB‑C signaling is used, in those case the datapath always involves a
> USB‑C controller/Type‑C mux/switch explicitly represented in the DT.
> For native DP signaling, the common pattern is that the DP controller output is wired directly to a
> DP connector/bridge, without any UCB‑C components in the path.

Yes. Please see qcom/x1p42100-lenovo-thinkbook-16.dts for the example.

> 
> 
> > > 
> > > > > +};
> > > > > +
> > > > > +&mdss_dp0_phy {
> > > > > +	vdda-phy-supply = <&vreg_l5a>;
> > > > > +	vdda-pll-supply = <&vreg_l4a>;
> > > > > +
> > > > > +	status = "okay";
> > > > > +};
> > > > > +
> > 
> > -- 
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry

