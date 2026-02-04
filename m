Return-Path: <linux-arm-msm+bounces-91745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMcTCNacgmlgWwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 02:11:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C69E055F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 02:11:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E8BC3111DA3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 01:09:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A575823BCFD;
	Wed,  4 Feb 2026 01:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ShAMpItd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XkFad+UZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E5323E340
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Feb 2026 01:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770167362; cv=none; b=B5TJYHsLgdfRJLEcxiWn66rOAda7crOQvv985t9nfKIAUrDRwqJiTp7LbC+kDgq/zHQdrAwv+xlowWaqr+tdPn++9x+dWDEkFp8FMinfdam03IqyzHWHI2lPKrHqr5kvjsgWZZtUKAKNu935FqpMDr3DnKeiWJh35C6zkmP5g1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770167362; c=relaxed/simple;
	bh=1WjSo78mpjSv1E8ghOliWq3n+e8zkyOSCGYpfSKa1RU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XgLOsjG8EYV2mS7mvMkeBGVMzezgHeI0YNLRdcXPSkVH1m4c+8y30slbaCB0LRxusW43MOFTsVcA9w25ugUPwKDJlMFMWGVp4bOohJt7OQbZ1BMFcobQvHMU9mp/OPNtEVwk6piB8FK2iSQCnB7BgfJC1wX7/aeu3LW1q71JkaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ShAMpItd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XkFad+UZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613Im1ch2053930
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Feb 2026 01:09:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LuqdMjFy/B9T6Oa4Wv44BkWrCvshQ7ZtX9ueUrYIesY=; b=ShAMpItdA6ULO2e8
	xEChtiLgeDm6SEXSkn6BcyOzgdb5PvnpkhjEA/5guIF2C2aUACr0Olrnjk7OR13W
	OJK6vSA+JAT5VvC2okLez/b2ord+K5uPrdPk/ECfy4rGKRRTOgcnVgui5baOf9YA
	9lQcyiSvL/cWLx4iEyqUtt/7biii81j2xdwEmUb9FerHeGV6gcMhpNt9OEAB+BY3
	qbW+WHXryGoIKe8Re8JNv8RW238WiaYPuiTGWFAs/TAe8OJELqH1tAjGmPB7YFb5
	PHeRJufxO5VBZdoT4DzWP7XGtiXRwPVIOK9pnzMk43g+TdGOu/HPeZIqtWuNB2Uc
	L7FwHA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3gsr2bxa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 01:09:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8bb9f029f31so1995832885a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 17:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770167357; x=1770772157; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LuqdMjFy/B9T6Oa4Wv44BkWrCvshQ7ZtX9ueUrYIesY=;
        b=XkFad+UZEJosJ9VJnIay2yseZs/hherNyq7Wd3SiouiWWch0HYfpnyHFAUv+LOJAgS
         1cThIuemsqbVPIABKG1ZdzAM7ld2UkXViYdJsbz9E+cEHnL88Z/SgQmWCTKYrdRBBa/N
         OpC7p0E1iW5N73NgEqNLSOV5VvzuIbCzeycbNFHTbw3WUvzACHZKont4U6Bl5HsIwPcY
         qW/AK9joHHEag98o5fLoqQv6gI3gAernCRIR/Vhd/9OeMYEnMaimOOQPE9fgfF0S0YUR
         TRj9YaZckLkRmeisJTeUjhvEnmDl/tnrdF37r9Jv6LNTh3bX3lvS1QPwqEEBQMRn/teU
         2sNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770167357; x=1770772157;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LuqdMjFy/B9T6Oa4Wv44BkWrCvshQ7ZtX9ueUrYIesY=;
        b=tV5Z0/kLbGbLBxOuPo6VU+Uk5P4kZAvkXh/Pcm7VYnNe/7fLkDDV9780kju7dVfyIA
         oa7GCWRU1qiGowEZUvG1oIVYyRiinGTkk4FpGs9Hpzb2FMKAhI+7ggw9iWPkim26HOAQ
         bbAn6LMjnr83rR22hJAQDqU17vGrhDPUaYfFeKu3nNhanMdyxvPPCmoYqXtk14GMyBZR
         cIOp3KWoQXjluzunPMv9zAICBH6vWFBdS0eMcaT8msbLEEpUbxxycAuocKoFzw0Fs6C6
         OJIBVQ1n+5k3xs7no6i+KLTVqfdHdDn2foeRMuKiHIgEiL3/o1BmOBmnsUubPmbLb1hm
         0Zpg==
X-Forwarded-Encrypted: i=1; AJvYcCW1pWTVUd0fZsVnxjOX/QmDa6rXoaWjjhdRbNSBEHPunefjpmFlJ1/s0iwsMH7oOSBq8PuR/s7d6yj6SGyT@vger.kernel.org
X-Gm-Message-State: AOJu0YzCRlDCkLTC/pFsq5rEBUwsQ/VkIMR0dl0oGFYHF6AOBOIlJL/i
	nwqTASwJfeEP3JRFJv1b4vosV/qFD0ZKxwBTGRuvm2/G4SH3qBBuzJPD8FVsc/Bf3Hqtu5s8iiG
	JLy2PdG7rY893W/j8x7c9iNz/8WJlQ9rdSmqsklXf0IFWMDG6BtaMw/Gw2MWvOt3FrwLP
X-Gm-Gg: AZuq6aJibOR+pQl++id3a29YRvZw/3EKxlOhNhGgthTx7lwZbw/qqnLORXhMvghLYLJ
	+bVR2FVr4m4Tiu3Ft8ccDnxsGfonLuLK8pYwsUr3Y9RMtDroi0Efm6ZE2vLpLcRCHvNdq2Sk9bQ
	k97hsshQJWxTYRHagFMY/O6nt9/FZ9RJBP2v0EYr0aZscwK0GAOJq5nexKRAzUJ5yupao7EC+/j
	qnpvjiSx8rvr5BS40w3snNOGEFdUZITHZ5y0DdVYbZVjptVpuCjiocL1KXcykQnLt/98P6J/EZ1
	G3Q9mTAdSWmeSxTD/0ch+sSmtXr8paM7fAcfIf+t5rTX7WSDdQjejwqeUnypZbc7GqOOrZJ/zRQ
	zj3u5cXYEA47M9Zr76nau+Dx/l1Bc8sGiV8hOSyTrBpW07FPfWEUVl/AgL6HfK8oCRahyMEsMrE
	edtn/a2lhg2oBBthllgi9B05Q=
X-Received: by 2002:a05:620a:2844:b0:8c7:e23:fd65 with SMTP id af79cd13be357-8ca2fa5e9fcmr168787585a.84.1770167357112;
        Tue, 03 Feb 2026 17:09:17 -0800 (PST)
X-Received: by 2002:a05:620a:2844:b0:8c7:e23:fd65 with SMTP id af79cd13be357-8ca2fa5e9fcmr168785585a.84.1770167356655;
        Tue, 03 Feb 2026 17:09:16 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e38702777sm255540e87.24.2026.02.03.17.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 17:09:14 -0800 (PST)
Date: Wed, 4 Feb 2026 03:09:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: mkl@pengutronix.de, mani@kernel.org, thomas.kopp@microchip.com,
        mailhol@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-can@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, anup.kulkarni@oss.qualcomm.com
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: qcs6490-rb3gen2: Enable CAN bus
 controller
Message-ID: <2ho25tzct6t7gsuyufyg7m4a2ikmblhukb4uddwc7p35wd6yne@heippz3lh4kj>
References: <20260108125200.2803112-1-viken.dadhaniya@oss.qualcomm.com>
 <20260108125200.2803112-3-viken.dadhaniya@oss.qualcomm.com>
 <n6affntgff5wy4xmm255v5h2ejpepicpz2cybcuvsxmry5td6u@jucskv7zrzvv>
 <5cdfe5a5-3c78-45a2-886c-768b224ad776@oss.qualcomm.com>
 <wbx2qrkhpsntggzqkzkpi4sa6qv3buhkjbwmjoa7zgw2oc4b7u@qugyhcxb6qrh>
 <316fa702-6cd8-4842-aecf-c176a5a53e2e@oss.qualcomm.com>
 <qvuokwiqllm6zmlzj3pfvziylrr5krjya5rnf3ojeycdoutlro@fl5qukh4vorm>
 <5486697e-d02e-4b12-9a60-99d0de343515@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5486697e-d02e-4b12-9a60-99d0de343515@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=A+9h/qWG c=1 sm=1 tr=0 ts=69829c3d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Hkgm2XhW8hAR8BwWxV0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 3NMU7ohl2nNMIIwzJbpJxYjhS7RnmPr8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDAwNSBTYWx0ZWRfX9kPdXI2KE6J4
 QJ2tyQE8G0/X/dqxKmZbjXHAAcBmGSKm66DLRH4wHdSyHJoVArgPqx8OsbWJO1e3X/bVlDuHurw
 syPE9r9moGNDjJ+crkQniWZLZ8jTktRVxEWOm6zIys2HCqVHR2WrYtzSp3WwzpyOe6UL9Tbz505
 LxDIjG+WGZ9OxfsuWzyHq0QSUYZXCaLs1hH6ScFS6uUhA/EPughe0iKuVhS/p6J5K5enkmtXA/C
 1l7mSPZvr1D2iHVeupwAACAt6MyzHPaIyo1ZaIxRkQOTXlfnDSohlwUf2jHhmYlWyKXe9MIXqDK
 459EQ0rpvIFO43ZS2lcuK8zdi19f7ZFvSligLAXOed+UqUp2+DoCMvkSplxB89cw1fCIHtRPQ4V
 w2FDz9V2fWCSWwsuF/+5dDutIBHVFC2g70n2Uk8WDB/cwM3XtXYehAD7AUgMPqVd2hShx1qPYwI
 Y+1M3HnZeBcb4GEJq/A==
X-Proofpoint-GUID: 3NMU7ohl2nNMIIwzJbpJxYjhS7RnmPr8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040005
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-91745-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 70C69E055F
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 05:07:11PM +0530, Viken Dadhaniya wrote:
> 
> 
> On 1/19/2026 11:59 AM, Dmitry Baryshkov wrote:
> > On Mon, Jan 19, 2026 at 10:21:37AM +0530, Viken Dadhaniya wrote:
> >>
> >>
> >> On 1/9/2026 7:35 PM, Dmitry Baryshkov wrote:
> >>> On Fri, Jan 09, 2026 at 06:23:39PM +0530, Viken Dadhaniya wrote:
> >>>>
> >>>>
> >>>> On 1/8/2026 7:33 PM, Dmitry Baryshkov wrote:
> >>>>> On Thu, Jan 08, 2026 at 06:22:00PM +0530, Viken Dadhaniya wrote:
> >>>>>> Enable the MCP2518FD CAN controller on the QCS6490 RB3 Gen2 platform.
> >>>>>> The controller is connected via SPI3 and uses a 40 MHz oscillator.
> >>>>>> A GPIO hog for GPIO0 is included to configure the CAN transceiver in
> >>>>>> Normal mode during boot.
> >>>>>
> >>>>> The main question is: what is so different between RB3 Gen2 and previous
> >>>>> RB boards which also incorporated this CAN controller? Are there any
> >>>>> board differences or is it that nobody tested the CAN beforehand?
> >>>>>
> >>>>
> >>>> The behavior is consistent across platforms, but I do not have details on
> >>>> how other platforms were tested.
> >>>>
> >>>> On the RB3Gen2 board, communication with the PCAN interface requires the
> >>>> CAN transceiver to be in normal mode. Since the GPIO-controller support
> >>>> was recently integrated into the driver, I configured the transceiver using a
> >>>> GPIO hog property. Without this configuration, the transceiver is not set
> >>>> to normal mode, and CAN communication does not work.
> >>>
> >>> How do we verify the mode on a running system? I have the boards, but I
> >>> don't have anything connected to them over the CAN bus.
> >>>
> >>> BTW: can you recommend any simple setup to actually test the CAN bus on
> >>> those devices?
> >>>
> >>
> >> I tested the CAN controller using the following commands:
> >>
> >> 1. Loopback Mode Testing (GPIO hog not required)
> >>
> >> ip link set can0 down
> >> ip link set can0 type can bitrate 500000 loopback on
> >> ip link set can0 up
> >> cansend can0 12345678#1122334455667788_B
> >> candump can0
> >>
> >> 2. Testing with External CAN FD Adapter (PCAN-USB FD)
> > 
> > Thanks! It's price doesn't make it esily available, but it answers the
> > most imporant question: by the USB CAN adapter.
> > 
> > Did you add
> > 
> >> A GPIO hog was required to configure the transceiver in normal mode.
> > 
> > I'd phrase it differently: to pull the transceiver out of standby mode.
> > By using the GPIO pin you make it always stay in the normal mode. It is
> > fine, but it is not optimal. Instead a proper solution would be to use
> > the MCP251XFD_REG_IOCON_XSTBYEN bit. Could you please instead implement
> > support for setting that bit, based on the DT property.
> 
> Thanks for the suggestion.
> 
> I tested enabling IOCON.XSTBYEN, but on this hardware it doesn’t bring
> the transceiver out of standby by itself. With only XSTBYEN set, the bus
> remains inactive and no frames reach the CAN adapter. Clearing LAT0
> (driving GPIO0 low) is required to put the transceiver into normal mode;
> data transfer works only after LAT0 is cleared.

Why? It should be doing exactly what is required. Could you please check
the voltage on the pin with the XSTBYEN bit set?

> 
> Given this, a practical approach on this board is:
> 
> drive LAT0 = 0 when the controller is started to take the transceiver
> out of standby, and
> 
> restore LAT0 = 1 when the controller is stopped/suspended to return it
> to standby.
> 
> If you prefer, I can make this conditional on a DT property (e.g. using
> an existing standby-gpios or a new property indicating that the
> transceiver’s standby is wired to GPIO0).

-- 
With best wishes
Dmitry

