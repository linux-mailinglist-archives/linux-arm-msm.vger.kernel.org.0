Return-Path: <linux-arm-msm+bounces-103881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qO9XM8IQ52nL3QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 07:53:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AACD43694F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 07:53:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 072EE300BD92
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 05:50:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2AA63385BC;
	Tue, 21 Apr 2026 05:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oz50KCKw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jgD5ds1F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E3B3368AE
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 05:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776750646; cv=none; b=AR06NBEjc1syoYNdXyn4IrUU0xNPi6qksQvfYZaxB0zt4rXudhkS6YdDsnVal3paPMNfoXtCYkrJo9WkjV8MgIb+5+PmAMCHxfKhavSLFoPGNxts/QNW6P3PqlvKx2aJAVT8Iq92OiYAJGCLmpk2EFXBd9uXrxH3CU9vH038Xyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776750646; c=relaxed/simple;
	bh=Ma2F8m/bDMhSI7Ffwjbd7H0bWVVF1mYXZaXGnaO6JrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cGVzw6XuNTQb0gO4Ym5VFH9IvjSaVbpBhvBfHBhVh7EPXV4ePdLn6DYrLXszgY7M95RdopRn8X/l2I3VJALlMSk4H6kmQGh8a+PWO2Nxexy6RigXkbqAuRbwFcpbPZ6TDi2dNDWvAjzEi/fbk2nssIE2FA7fLnnYCbmBcZ82pys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oz50KCKw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jgD5ds1F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L5g15Z3455276
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 05:50:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VDMTCJt9tkGymDiOnHfYrtpW
	tA3tQv0mZLbj4noOZd0=; b=oz50KCKwAA1y7tlWZhNpgOE57wXZJ61yZGcPi5ii
	URgmtf7oUJGVEht30bNAnNSid4Gx7mRv0LEpZCp1JG47YnOscmSXl5uXCEsAEzuC
	Vai85BnWbJTJXmMVVDbXDj0mu7T1Z2yIQDuT2xgSm/vvy6jFmtd7Cav5t4Tv0CgZ
	MvHFgaqcbbr6Zb4sWEADl3JK6D6UAHZfqWzKlWEGVsscw5XndB8DEyV7imUteOon
	Zni8nHgPkbVTbKBXCKAaFumeql/onrQgp7SP68CXKTjaLNrX9aYkOPrBMlcdDBI5
	jv/NCygmh03HAZ8cdHiVBAWPhO99glPlW3NvaDJh/1mw8w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfvjvgwu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 05:50:44 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82fbceb0181so1252452b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 22:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776750643; x=1777355443; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VDMTCJt9tkGymDiOnHfYrtpWtA3tQv0mZLbj4noOZd0=;
        b=jgD5ds1FmtqTsyi08u4BOdMnKESim87rENJ/+rLtbtMrACWSXae5Zu8q9l8gLpTT7G
         oPJaMfyFU8CtMkBbfMVHC0d//BiG8n4kaZZl455pweSqQFWW7mbpPd1jrpXy3gqdZ+fp
         60HKboxApFoei1vwHv18/3NhcA6PP8t5W4CuwamaxV+ZF+o8Z3B7CvrORoCQ5eIUDCqw
         dz1Amwwf40OfHkfuAGhOESvgbWvNuwq05xdPXLgV5VGOfnvARlbKKp109IpsKJGM05oG
         fJW1j+baRzB3ywGeS59bVZrzVJXVTMYbb+Uonx/2DM/gsBrpl3o6WbrKLr/2xQb9uck5
         0UlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776750643; x=1777355443;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VDMTCJt9tkGymDiOnHfYrtpWtA3tQv0mZLbj4noOZd0=;
        b=cpHH28F8wlNSKe6cVjKnzRcpw65nb9KQqFqrvUr6XLwJwHYT7oQTvBN0g+IQR2VoBJ
         0jTLIV3uKTibkMSp2qYD1u4ohJU/3Lnf/lLR2mY0PIvcOO6+ZpohDx+I8eLgLhyO/MfS
         sGcSnB0g1r7v+ReG8V/zhrpJ5KtwolqFLT9ELmhaO1BVU+z0StXUD8LIUJvYUaO4buex
         lFER1uOFmznmqvl6rvKG8KeO5T3JFcBkbDYBmfHqjMmPVumkAT4v2sUhIdgTU/iAnBen
         ygyCUBS4bLBpwn1fSKQXyfy5rfoEz490AM2lt36k8VySQaS9S/6nVzR65OYJF30sjUO/
         cvTg==
X-Forwarded-Encrypted: i=1; AFNElJ/ZmrdF/kBJnYeqcv1Z0+vEvnNEy28EcNA3LB1gDci2mpG6LENot7Lt8dhw9jRD6YNu2XZ9oN2JofcNwSZp@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc4M9mIt9/2w1nLu2FqDghTkJStEA4+cbs1xHzKvQNcARoqET4
	Z9m8RsIPZRWi0D0iW1f1D/gVlZMlKnYNfmj2cVuQNzxZhOwl60BdnBQqbxAtorW6fGJWpI5Mhmp
	miTI778DOh6//X03FCzVhfauEKRhMvnRyaa7g5qT3tSFXZKATEPqxdaYucQnw1oyjctfW
X-Gm-Gg: AeBDievauRPly3gVCHbmb/C5wx5okrqK5Z04ewOFwfv/I7OrgI6h8rOFwxreLRWYUed
	LvnQGOLpEXrfm2H+ncg3XJkjwI6h6875ZKEeMgZuEMjabAcFNStXTTQC5/CCoaLCINcSWhifuUC
	pBMvTmRHnhPJ0NUDrTwWr8rissGRkC8W+O9Yzy8UB2BqokNJQY/y9/76vzsu58rrs0P8O0Pb0Oz
	dl8jtcnCJSiO2d6Y05Il9wcQ85uIwafy482p1OAlNqFrzmCcSg2JPR01zN9hdmK1ogfuwksWezv
	tdKrOOkyL7kUX0I0EhBkemRYfyodwg5m35j1X+E0FRJP6MVvBehEfSB5La/I9jfud9/yRmkiAqs
	e9VJLCj9t2k98vagR7fXuNL70SSpQ+qtEipreo4jF18kZhP7YFDqSSQTeMq10BDMlW7iIzA==
X-Received: by 2002:a05:6a00:1993:b0:82f:6841:8733 with SMTP id d2e1a72fcca58-82f8c998ba9mr17278542b3a.48.1776750643214;
        Mon, 20 Apr 2026 22:50:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:1993:b0:82f:6841:8733 with SMTP id d2e1a72fcca58-82f8c998ba9mr17278498b3a.48.1776750642707;
        Mon, 20 Apr 2026 22:50:42 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9cbb1dsm13700652b3a.14.2026.04.20.22.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 22:50:41 -0700 (PDT)
Date: Tue, 21 Apr 2026 11:20:34 +0530
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v8 5/5] arm64: dts: qcom: monaco: Add OPP-table for ICE
 UFS and ICE eMMC nodes
Message-ID: <aecQKiWBMHBYMt83@hu-arakshit-hyd.qualcomm.com>
References: <20260409-enable-ice-clock-scaling-v8-0-ca1129798606@oss.qualcomm.com>
 <20260409-enable-ice-clock-scaling-v8-5-ca1129798606@oss.qualcomm.com>
 <71c6c453-4a6b-414e-a039-80f36e948489@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71c6c453-4a6b-414e-a039-80f36e948489@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: IrgBU9_CB5b0TR-ENseox510282aGNAA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDA1NSBTYWx0ZWRfX/kjyZiYDkitt
 uVuYyNiwsYfdhlFMTTyddmwCDsr0b9SouHPoHsoj4ONP1P6U2PIcycQxiS/cFQphavL4xnthVc/
 0+RQGBQ4TfAuKUBQE6MIDhPqpgR7C8iVHliglvl/06MElRhOnLy79CFoFKtMhhzBTFcGWPJqMSe
 ZNjikT/vkheirElyZEyY6PhRO4DM7oIH33FOksMrOHVXTuk8XFVy2Z3kMkRtR7g0Nsg0KlP9p+a
 5jdWJOxMRiwMqJ53gdP95Wl8bDOwAKdd6z+hGQw7sQ1wbbHKcoqDcqrY0RV9ks8UIYtLTUQ0zSs
 J50gZEN5lKozjE1ft0o+aEVfAFv4dZ30hEKSeOhAvbf9TV7y6ZZ04LxpSombTwGF/3u5msC2p+p
 QQci++P6+aJkjOQnaVvSR/mxWTG7MwGVaQ2tockbGEfFVuAyqmfCdI/7oVRRrqg8GLgp44fwaUm
 plk7JYqLfIyVlNK4b5w==
X-Authority-Analysis: v=2.4 cv=XNMAjwhE c=1 sm=1 tr=0 ts=69e71034 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=FjpnKfaMezcxXxbuv6AA:9 a=CjuIK1q_8ugA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: IrgBU9_CB5b0TR-ENseox510282aGNAA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_01,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 phishscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210055
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103881-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7AACD43694F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 04:27:35PM +0530, Kuldeep Singh wrote:
> 
> 
> On 4/9/2026 5:14 PM, Abhinaba Rakshit wrote:
> > Qualcomm Inline Crypto Engine (ICE) platform driver now, supports
> > an optional OPP-table.
> > 
> > Add OPP-table for ICE UFS and ICE eMMC device nodes for Monaco
> > platform.
> > 
> > Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/monaco.dtsi | 32 ++++++++++++++++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
> > index 487bb682ae8620b819f022162edd11023ed07be8..cb0e554e94d237b0adccb55fa9ed967bae9eea05 100644
> > --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> > @@ -2730,6 +2730,22 @@ ice: crypto@1d88000 {
> >  			clock-names = "core",
> >  				      "iface";
> >  			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
> > +
> > +			operating-points-v2 = <&ice_opp_table>;
> > +
> > +			ice_opp_table: opp-table {
> > +				compatible = "operating-points-v2";
> > +
> 
> 75MHz is supported too. Please add that entry.

Sure, will add the entry in the next patchset.

Abhinaba Rakshit 

