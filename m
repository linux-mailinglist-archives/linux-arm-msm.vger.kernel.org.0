Return-Path: <linux-arm-msm+bounces-107360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLwqFIWNBGoKLgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 16:41:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 390BF53549F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 16:41:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E42863072D6D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 14:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62AE343E4BC;
	Wed, 13 May 2026 14:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aRyIGmXP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LA8n92iY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CDC43E9C3
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778682878; cv=none; b=homF/+pPZpG9yHQLj+1Pn+Pk0z8HoVxh5LOPstPhosA+JPSqwxf9PBfvgujl8/wCaAjo1FlUmAyKr05T1VgocazEgTIfuDYo8OLKb0i/ppPncrYiv2pGWuu4v0IXZDFgDUmyREgYA8vFb9dy8V03HjFlY+l8RFTUwEq87dO+Z3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778682878; c=relaxed/simple;
	bh=/pdfpnwvAQYfQ5gh7pBGcP7YLdoTlGoQcnR738kvo3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LiMSAy7DI9v+CVyjaAfYKIL7AHoaB6ATwgiuG6YF6AqjzrDtW1UOR9NkpgY5Y6A5WHRsBLd24ChdMSj4Z8nR0tciXYsvHsh2x+bKE+J8bDaRUtPZQRE4xSQwfdK0YoBKhPRdfwgRjEdjlHgOlIq62YpQfJeApUhpjNbMMgYCctw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aRyIGmXP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LA8n92iY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAW7NU2338896
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:34:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3XxYOiP/1DPzB49oJMVBmPZ/
	RAdf7R3nS8r+qfrQbwg=; b=aRyIGmXPhtT50lMQOIYHV9y7f4c+SnxnXsY2gUnf
	42v2aP4LSfoW9aGNVVkOgdLmzcaG9EoNb2lttZyx7XG/ddpXrZdg6CUSAsLJX+dg
	T0gqAtNptLIVEhZH6w7Tu269aMHTVoDWMFqmmFQ3g/+acFTaaZcu9YuEqWzzouu9
	7sKVvlPQRMYJiYnPz0b2ZHfceE/lkis0qZN2/Q4qBmXoBiwdVivhhFu27oSgJWaI
	5TkAz+k9Irs9yWOcEySevNyqyJ1TgnxwBUdNw0FAjic9XcXrjgJSMkz0NVHqNqJE
	4+7P7GtNZhp9h4Ga50hj4bPJA87mTOL3ENWYB6UR8bkxYg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e49vxbwt4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:34:34 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6374098885eso1680115137.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 07:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778682874; x=1779287674; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3XxYOiP/1DPzB49oJMVBmPZ/RAdf7R3nS8r+qfrQbwg=;
        b=LA8n92iYvqQPoLJyTLpJl4zbnbrTK7bLK+XY/k2uE+Hpf9xpRmDB/7nmC8CHvyXlsG
         DmY1F1/fVi8LvOuPv6sy1eqaA2OWkJvFFfOLc+1/Nqp6LhQbf6UjDZKaSl+h79NWfBVD
         rVcxGsX/YgN0y60v7Uw0HgrT+RjM9fceuSyDOhDtS3mY43pAwBpbMBh3Egu7lvOBjEAI
         BzX6M7eY2/nBd57Y4RV1VjUMIRYizvG8JnFW6ppRzijU+4bktEMbnQY+md4B7M5lZpk3
         F/VnTXY1VlbOr6Lts8q7fntfdupPWJriz+gxpt3e4Jf0xNggDaKUTMv2bBtk/uisSHpz
         fJQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778682874; x=1779287674;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3XxYOiP/1DPzB49oJMVBmPZ/RAdf7R3nS8r+qfrQbwg=;
        b=B/0zjs0OFp32YgkE9ldBxBYfdtGue7w6G0rCxnFHu4sHB5PTOR+kzQxRDAYJMsJUXZ
         Egxtd4EXa++oGTPIcf2/kLGnPoJ0psiQAiOabdjANZZOxWX3OGcdva3DCs3NTC2iWPqZ
         iWkdMlm+TYYLGCC6wLQzeZOe99WHH2GOWynhLoP3Hx7Y+rIvj961TDCsHq/l1JA5g0+Q
         lXfDPHVaSaLYjUyv38knAFSOOmZOf29Da2Aexxlkh48s4jHGZaYftpH2R6rEjUhsklk9
         DGsDRgt2LFRR0Izj4cr4omSC4Lnr7nOSTfTXyXcMVjwUp6jhv7Sk4vdfFJ8LBSJS8bYB
         xYxg==
X-Forwarded-Encrypted: i=1; AFNElJ+7ltDqzzsrdcNS+ks66eBJDzfxJLxPOieKcWNwRJ0MDG7RBSYwrm5kqAF6qWRmz7RyAhy2iaiKZKhn3a4z@vger.kernel.org
X-Gm-Message-State: AOJu0Yycju6ltReFTE8upeMHv4WB/gtQMkKlLoLGbCc4mv12b5a1PrL0
	Go5R64pp4Rdon+4mfkPj2VOeUeQe413HbhQGhY5MbgU/x24Ze4ytm4ZZF7o6Xrkr7GaGqjqD07h
	dg+fi2CUQWf44E5wIQAs606IWyvoI4sq5KmtctkKIN/mCulWQRlhrhK/buq4x09NGH22O
X-Gm-Gg: Acq92OGObRt3Yg8bdGanEsh41Et5ueLhPABAM4WsNXqIsoXRcS1G207PsDZxymW+sby
	WZJSN5A2tV12/NuHV8d1d2dGB/R01cAcInT7st7U+ZqIMtQlUzAEsiTP7LrZ2wPo0BHNzdrh4tm
	M/k7PlC0vRCBpR/xd7whBzuxgvZpFg0BWRjh8yP9O7c5lQE11Xds/1mt1BDuNd4h8Oo4v7Ts6g6
	BHapdSwybkm1iU/qngUbrjYdWgmECQpysu0ymCSKnw4xdXksJhArcpl/7BacLVjnDkmCd1BvrQG
	UFBf7ydzBcooUkrk7Tth6QCKrF5iJeIWXb373FnYRTlTMXf2W7BMle2cym003eQcOMPmLzQLWTL
	XrcmMbMPfk1ncC0VLeqDuDovhkqz633DEDBsY0VA9KjV+I7z8h4m5nONyiqNoxbIX1g4SNqZMF9
	nCX4isodGPQGiVVObC4V/tW2Mo7VhsFeYMt+LNFeRFnDgq6A==
X-Received: by 2002:a05:6102:5091:b0:62f:46be:8318 with SMTP id ada2fe7eead31-637733e7ec3mr1922769137.6.1778682873872;
        Wed, 13 May 2026 07:34:33 -0700 (PDT)
X-Received: by 2002:a05:6102:5091:b0:62f:46be:8318 with SMTP id ada2fe7eead31-637733e7ec3mr1922729137.6.1778682873393;
        Wed, 13 May 2026 07:34:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a956629bsm4052821e87.69.2026.05.13.07.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 07:34:32 -0700 (PDT)
Date: Wed, 13 May 2026 17:34:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Stanislav Zaikin <zstaseg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
        val@packett.cool
Subject: Re: [PATCH v5 2/2] arm64: dts: qcom: Add Xiaomi 12 Lite 5G (taoyao)
 DTS
Message-ID: <be3ubtrx6or4fyuilgpg5hy7z3wmoybsdj2xctxcacffhmdy2p@efme22p3abuy>
References: <20260417084749.253242-1-zstaseg@gmail.com>
 <20260417084749.253242-3-zstaseg@gmail.com>
 <pxldv7v6iymoa7oyg5xs5d76atl7fliol4oty3urudvnkoaynj@4xhovegebszz>
 <8216541f-3615-473f-b9de-139e6d32a7f1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8216541f-3615-473f-b9de-139e6d32a7f1@gmail.com>
X-Proofpoint-ORIG-GUID: jw1uoHFzdggXRjxZU52czGIcJLEI1l0C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0OSBTYWx0ZWRfXwuO9lqYXUYSf
 0mG1kfYiAARFgQO4nVy7BYaHwa6EsiZty9LaGC4TF/UW9V7xoRkvOKEa6wWqDTEV1NNvnV9BV1r
 ZN8OKnrBrihHpacNwdvlGOqFCU5GXfKVRAew3oGQ3aceH047gdF+19LT7oOFlNel4bq4ps7g6CC
 /mePKCqUA9yzoO4lNVOW52BZKp1ttiXKJGD4BDKs7jVh/L6uH2jfzLHaAFiAGv8k4ZQB0tIrMW1
 OAt5fT6X1ZMpg3W6VWqSlYXIZRFG0qFe7VtWSR1bmPHCGHqlACGBGzl/ak747tAgjBaLOuqBYtq
 Wn0eHFpqnWAQuTPSIFOVta1ruMLFd+xFoRiextejGuykK8CMI9gZiL6Vy4j09nX3ZwB+1IHeXos
 qQHpxcY2vKyo4SBPgbUBUAoEZKiNg/E0d6PzfenbuPFEtAhOhsrFxvFzEoRUP2qgb5dwNIb/sX2
 RiDOYs5zpqm65goS3Zw==
X-Proofpoint-GUID: jw1uoHFzdggXRjxZU52czGIcJLEI1l0C
X-Authority-Analysis: v=2.4 cv=A8Fc+aWG c=1 sm=1 tr=0 ts=6a048bfa cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=pGLkceISAAAA:8
 a=__p50U_0yobRTnod7CEA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130149
X-Rspamd-Queue-Id: 390BF53549F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107360-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 09:59:59AM +0200, Stanislav Zaikin wrote:
> 
> On 4/19/26 1:47 AM, Dmitry Baryshkov wrote:
> > On Fri, Apr 17, 2026 at 10:47:49AM +0200, Stanislav Zaikin wrote:
> > > Xiaomi 12 Lite 5G is a handset released in 2022
> > > 
> > > This commit has the following features working:
> > > - Display (with simple fb)
> > > - Touchscreen
> > > - UFS
> > > - Power and volume buttons
> > > - Pinctrl
> > > - RPM Regulators
> > > - Remoteprocs - wifi, bluetooth
> > > - USB (Device Mode)
> > > 
> > > Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/Makefile             |   1 +
> > >   .../boot/dts/qcom/sm7325-xiaomi-taoyao.dts    | 907 ++++++++++++++++++
> > >   2 files changed, 908 insertions(+)
> > >   create mode 100644 arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
> > > 
> 
> > > +	firmware-name = "qcom/sm7325/xiaomi/taoyao/ipa_fws.mbn";
> > > +
> > > +	status = "okay";
> > > +};
> > > +
> > > +
> > > +&tlmm {
> > > +	gpio-reserved-ranges = <48 4>, <56 4>;
> > 
> > Could you please add a comment why they are reserved? I _assume_ that 48
> > is NFC SE and 56 is fingerprint reader
> 
> I can add a comment like this (or you can suggest different wording):
> 
> /*
>  * 48-51: presumably NFC SE
>  * 56-59: presumably fingerprint reader
>  */
> 
> If that works, I will add in v6.

Yes, thanks

> 
> Thanks for the review,
> 
> Best regards,
> Stanislav

-- 
With best wishes
Dmitry

