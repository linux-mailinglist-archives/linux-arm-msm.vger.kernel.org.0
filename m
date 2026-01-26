Return-Path: <linux-arm-msm+bounces-90577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePdlB0mCd2m9hgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 16:03:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B197789E40
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 16:03:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A1B3C3006B78
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 15:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ACA9330D58;
	Mon, 26 Jan 2026 15:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UfS+Fciu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KMWV88Gd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A56728D8ED
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 15:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769439812; cv=none; b=cuCf4AdR+AkNJQtiSFOvTKa2zeBN1Cwe0GNXWQQ2E66mKOGYpCT1Yzmem0Gs1DRmk2aYhDvbO4ZFAKsit2RpJmGVWCjRrGnd6PQ8uGo1wetmu4NRg+z7KqpP2avlhQCIAADegLzq/QBqSsxfNtEp42UZtZv/y1qU37XXeZEfq5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769439812; c=relaxed/simple;
	bh=FbRWRE99w1hP97Fxyw4gsfPUF1oyccUPfN1+ykWolw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kfi7PwS1AhvdvUd+vBjkUMyrCPuJEvLr8uULjtdzChvobW17NnUk0QCkbAqW3JV/0NI3GGsUhEN5MrEAeIW9rcvLRIgAgGSpgJkzZ23fZt5omzkbz7NG+YhFrpVELR1vPk94cD0jNNoxEDFbyy5pdvJwiHipPe/oWoWxoUa1JL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UfS+Fciu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KMWV88Gd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q8Xhb9121436
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 15:03:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ejhhd5mKIO+krlcy04QgJSBx
	/8PrM5U8ePcBuVqH5kY=; b=UfS+Fciup/w9pbRtz8TmtdJfrakX0K9PaOZ2qKFg
	ZY+zKHudSOfTkulQ/ONUcLO/DT9ZK/kOnz9zPh97PaECEeS3tcjT1nk5oxaSauav
	k2tH2GyD2o87ejjen2Sm3KqbW9tpNirczDW6Eoi3K2mxOpNv7ajOS5jOw+pqAqib
	T+8AbWDVhYFGyt8xuW4etEbdT2H9tbtl3VFLgQ1gNKtGQ8IGawP3ArEy/kR57Zag
	4t+OyRXm3LVU6VMkdJzUbb9T0vPLWwlOSv0wZFzREHXTnffB4uSamtypojTA83WT
	r2TTMKWptNKhhaLAsnd/XmKOhRgiXn656T/u/GDHbKpIpQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq9tvu3s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 15:03:30 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5662a8e87a0so5536378e0c.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 07:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769439809; x=1770044609; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ejhhd5mKIO+krlcy04QgJSBx/8PrM5U8ePcBuVqH5kY=;
        b=KMWV88GdiW6PhKasZ7Ssiw9Fpy/1pMebJQ4abeIFIWmnvRZHn6WrbAYnHu6a8nqO45
         RWeRcpcWUPKXkt94B4SLZlZao1EaZ06BPkJ1VPakaiCik7igVYF1HNjYDLwh0uj2tPyJ
         5zgGJDEJQ8Qtd7YyEz1cSQlZoXBOedZHTY87wmvHcntEjola25WNNzLmOlihx6oi47V0
         ExfuKXLYmOnSI0HLivXbLG07ObGJDPZQXnCeWql/vEuucFACJvD8P8OjIy2cAwRwt0Mn
         ogEMqn64nkmJKPunAdaakTP5BSKZyWCqq+81aDmma+l7cYY6qTdyFo7ufxDV2YNrVy6y
         /KXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769439809; x=1770044609;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ejhhd5mKIO+krlcy04QgJSBx/8PrM5U8ePcBuVqH5kY=;
        b=vJrQQLQZ0qW+O+J13W7RqJGLYXA/1nrPakB9g6x3pQhGkYW/XWfTgWThpd8NTmRO8v
         /R84nOAyjbarYRM346LgORq9lLwVEi7ixGhkQ20weqbfsz46h8twXx0Tz7Wh00aCvVpN
         78Z57mC6uDqCXvUjm1KzBQnn+Z6Qd4UVMmvjC9p22rbplaVTbs8O1N8OOl0NWH9SHnWa
         KSS3NrF6iMMPmV3mMMxl8Xdi/axMArzHXnn9DL0NnKKld0sYjJ1hCNJN4HHK7GPFlx7f
         OoY1VEFrzo4pQSGovc9hOdfR3j1P+0sksZt4Q+i5XJ1XLw5lO06xa9GrS4m28KYHEG6x
         9UZg==
X-Forwarded-Encrypted: i=1; AJvYcCXb+xO/7ELW4R/JQsZteFr8Pph4oJ4JmFgxKaPD37BziZSBHDNB+VirGl2JD6RGNf8X8ZEeyUZNIZbBZX3O@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+Wd1QnpZb73vdotFHix5Y6WfiyC0cWzlm8W2bMaDWiE8kbyHu
	H9ZAOTn0Gux0vbo7nbNYMO13qkjK5NGaMIRkDm2jOFKExkSiRN10zNXLASdpoau2OP994V3KYxP
	+Xf8mM2Vnr+VirzWs9FTv6A/YuJzFLRGsHgfLhql97JDXRDfqrA5Bnl6kFwee99q/6yyc
X-Gm-Gg: AZuq6aKW/yF/d6KsYdajwU37jpU80kWR2zxkruNI8wAp3+fnfNl7r/oNBq+lhwFjqvb
	ueE13ud8Dp7TVXNDpeh/FL4BmumaVM9BNfqVvF9SOnf9klD89s04y/iLuGFk+UyyjNW9DIdLKVJ
	a/utht6T5apMdo/X7uYZcnMp2xUUk5ans3AN8f14Lz+114OZ5x4ZIXHRA0do0W0wk49yk1MoSRX
	WvS7QS4Zl7fFl5IKnCvnAowZBGzuU1WUTCgluTXruDhL2HfTXtcdvw/+eEjDn9glo8qqtsFPncw
	OsdJB2ZJlQNyfo1sQEG6Px2UwgN9a1oRkqV7T4RGIzRcE6IQvUp2tWSul1Zrj0PQBYzY4Rj5NE9
	BRVq2HxtC/8qvGTgCb5x3TDpC
X-Received: by 2002:a05:6122:511:b0:566:20ed:44cf with SMTP id 71dfb90a1353d-5665c938cecmr1526544e0c.3.1769439809211;
        Mon, 26 Jan 2026 07:03:29 -0800 (PST)
X-Received: by 2002:a05:6122:511:b0:566:20ed:44cf with SMTP id 71dfb90a1353d-5665c938cecmr1526517e0c.3.1769439808641;
        Mon, 26 Jan 2026 07:03:28 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c24bedsm29701894f8f.17.2026.01.26.07.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 07:03:27 -0800 (PST)
Date: Mon, 26 Jan 2026 17:03:26 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: Re: [PATCH RFT 2/3] arm64: dts: qcom: glymur: Add USB related nodes
Message-ID: <5upi7gbk7kqsy55zdcmsnorvjtvpkbir72ohkpxy5glolnle5z@4h4tiqjdmui2>
References: <20260113-dts-qcom-glymur-add-usb-support-v1-0-98d6d387df01@oss.qualcomm.com>
 <20260113-dts-qcom-glymur-add-usb-support-v1-2-98d6d387df01@oss.qualcomm.com>
 <01de4054-eebf-4ef3-ad74-c806b208a848@oss.qualcomm.com>
 <wh4qsgwl6drye2d227mv22pxz57cikp6ogabklo6fvlzljqafp@sgps7d52yp2d>
 <cb08a156-d905-419f-88f1-77bd136c823f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cb08a156-d905-419f-88f1-77bd136c823f@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDEyOSBTYWx0ZWRfX9Wm/PUnKE/YR
 5S66OzM7yE34owWGFKVwZy0EMh1u3jgCeC87xGEEpignNWBnrg+ZPFCIIl4/mjQ2+RdaXHFIMWU
 naRavLXraTmHM9mWUlgMgedNjZb+HJENMusmrw/Zszkhq2e8Ma7fSux0RfDwfYmmKYVUmW46L0u
 ZWVper9WPwnF4+rGLaATM27ugeBxfc2Bqoz3OrjiZXsmHVEkCS3L6D4xdkgndH+K+wDhSgF1DVQ
 X4iwjHZQ4fOnW5u125U2rWMMz9wFFKsnTzL6Ajn8L2IUpur3oaD8k2Nvh53IizZuG0KKbUp7spn
 K3jV5L3oJ0HSElYPuJx7R5Qm2Yc+mkugu2BU/7RBKYCB4aJOO7BAEPjq5I/CWLxejiNkUXLhyq1
 No78PPl37FnGhNPvkNyimuoX+cyLbKXf0aUavxUQ3igsMAdECd3lOa9PsCuJV8IOKLBWvFugys2
 HC8bKBKcXT5vUGZIkAA==
X-Authority-Analysis: v=2.4 cv=QN5lhwLL c=1 sm=1 tr=0 ts=69778242 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=woEmaW9y2rYpOZNNKUgA:9
 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: 86GYWtOGD5tPBFnQbzmBGLQDz6G-0zjd
X-Proofpoint-ORIG-GUID: 86GYWtOGD5tPBFnQbzmBGLQDz6G-0zjd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_03,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260129
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90577-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fa2000:email,fd3000:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,fa1000:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B197789E40
X-Rspamd-Action: no action

On 26-01-26 15:44:45, Konrad Dybcio wrote:
> On 1/26/26 3:31 PM, Abel Vesa wrote:
> > On 26-01-13 14:13:32, Konrad Dybcio wrote:
> >> On 1/13/26 1:33 PM, Abel Vesa wrote:
> >>> From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> >>>
> >>> The Glymur USB system contains 3 USB type C ports, 1 USB multiport
> >>> controller and a USB 2.0 only controller. This encompasses 5 SS USB QMP
> >>> PHYs (3 combo and 2 uni) and 6 M31 eUSB2 PHYs. All controllers are SNPS
> >>> DWC3 based, so describe them as flattened DWC3 QCOM nodes.
> >>>
> >>> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> >>> Co-developed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> >>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> >>> ---
> >>
> >> [...]
> >>
> >>>  
> >>> +		usb_mp_hsphy0: phy@fa1000 {
> >>> +			compatible = "qcom,glymur-m31-eusb2-phy",
> >>> +				     "qcom,sm8750-m31-eusb2-phy";
> >>> +
> >>> +			reg = <0 0x00fa1000 0 0x29c>;
> >>> +			#phy-cells = <0>;
> >>> +
> >>> +			clocks = <&tcsr TCSR_USB2_1_CLKREF_EN>;
> >>> +			clock-names = "ref";
> >>> +
> >>> +			resets = <&gcc GCC_QUSB2PHY_HS0_MP_BCR>;
> >>> +
> >>> +			status = "disabled";
> >>> +		};
> >>> +
> >>> +		usb_mp_hsphy1: phy@fa2000  {
> >>> +			compatible = "qcom,glymur-m31-eusb2-phy",
> >>> +				     "qcom,sm8750-m31-eusb2-phy";
> >>> +
> >>> +			reg = <0 0x00fa2000 0 0x29c>;
> >>> +			#phy-cells = <0>;
> >>> +
> >>> +			clocks = <&tcsr TCSR_USB2_2_CLKREF_EN>;
> >>> +			clock-names = "ref";
> >>> +
> >>> +			resets = <&gcc GCC_QUSB2PHY_HS1_MP_BCR>;
> >>> +
> >>> +			status = "disabled";
> >>> +		};
> >>
> >>
> >> [...]
> >>
> >>> +		usb1_ss0_hsphy: phy@fd3000 {
> >>
> >> Let's not repeat the mess introduced in hamoa..
> >>
> >> Perhaps let's fall back to usb_0 etc.?
> > 
> > Sure. So then:
> > 
> > USB SS[0-2]              -> usb_[0-2]
> > USB MP                   -> usb_mp
> > USB 2.0 (USB20S in docs) -> ?
> 
> usb_hs

Fair enough.

