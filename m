Return-Path: <linux-arm-msm+bounces-92094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eM/iFpgphmmuKAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 18:49:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C6504101698
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 18:49:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0EAC03024294
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 17:47:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 637BD425CD7;
	Fri,  6 Feb 2026 17:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W9fTG4uS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YGd4X7M9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B413AA197
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Feb 2026 17:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770400048; cv=none; b=uASyzTQtw8wvVOHGuRy5f3m3lzEUQ+XvLH9lk2kgeFkAD/V+VVV1v0X1+o3/YRo8JeDW5wFwYf416D1Nt6aB55MmewwH/+pQ242lvbDvRhCh/FIYMOl9I7u7ztA/bBTEd27dS30muINAY/7kevnWrMSqFQF/6yvUHydhyrAA82c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770400048; c=relaxed/simple;
	bh=OojO+5aHAQtRyZh3xE0pk/6OHjLK9A70jXd//E66tcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I4iPONp+7yuxxl5e/XiLODWxEkInSwCNJSk2KuqTsQ40UIueYZLhsRzxES38rFknJDJNQmP5PzTg2sWcPwdVide1LV/qhZ9wyy1OtiH+g1WhcLeM0nlD2zP9C5IB2dfLvhBHp5L4gXL1EmWwv7oc0qVfDp/0Ta7/BOuZJGH/10s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W9fTG4uS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YGd4X7M9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6169QVK62228147
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Feb 2026 17:47:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JeAK8W5bASUrOk/wsANuXBS9
	FG9IIQyboshL8sgP+l4=; b=W9fTG4uSi/33BDUSrjfvQKup4b5E4354Bae4+uW8
	ILZykYpE4UpP6qs+olfqh50b4gryuQNb4I8Q53j5nIbVNnwNC9C3HZWrD55oEtr1
	VEgthx03UMC1rKN++3w1+iZKKDhqv8VP3/FMb56Io8Jz5Mx269CrfwjDdANdxh1f
	1bopMnGUaLmrcU/COGBaqUpL+zcA7EvW4K4Emzg/YhDVHUWE+ZWwECpO8IUqPCEC
	W7zsTlhpR3Ymt5Fyhn60zCxrtIxkXY/W78xR0JEUh5nOAX//VaGOW2Rb+t5BdFPt
	p8lbso/Wq7wzvLINjZtaxNeVdOAHIVy0w3m9JldV9nMn0w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5dnyhe9e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 17:47:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c7166a4643so699132185a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 09:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770400046; x=1771004846; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JeAK8W5bASUrOk/wsANuXBS9FG9IIQyboshL8sgP+l4=;
        b=YGd4X7M9P0fJjggsMC/1e0UuylV4LbRISKzRE3qI+dU3W3ICay17gRn8EA7ogPCQld
         5BDo9oD7lxARSF3UFpfjVQjdxKvR+xJ3M4PjraEDhdHOlvR/e4wUd0xd+T3DFBAlEzhf
         wFDlHo4qSviIO1O6SXeXxVnga69smOpo3pR6fRgUDrXa6SOUw1j42x/WFvIdX4ZKLZiP
         0Yccr7Pyzj8dRzq3hWC00rv2pB67nHK1aIbiuCEsFD46Oq5H/qItf0aC2QSzG1EiYNTS
         hIZJowJy1Pydz3+3pc3KlIo1NpuccFPnU/gXNyyBb5k6lko+s0jbG5oBtYGgXhEAkql0
         8l8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770400046; x=1771004846;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JeAK8W5bASUrOk/wsANuXBS9FG9IIQyboshL8sgP+l4=;
        b=NB6bjgQzTT/cI5lD1joj+Qcz6gOON3imPvNqt7iVatzE+mgNhm+0zQ69/cPe8EdXGa
         222k8pBGuS+692ntD/0cWRJ2PpTu7ep8vgFUdkF9wLPTpbvnxlC6hpfcLORVQ/iLRQEJ
         +h3e5vZJBzITinsNss9xerCiqhgEDmrap3olAXDzCios7YpPC54x4/H6w5u6bPBGB2bh
         JCVKwn1EqNeu0MbqZAoy4EF7V91I2n1Y072c+6ilR4TgGdb0y93BvrFSsaGbHCZHzdVu
         mttSHh+xxKzIKFADlBUQXdsWY7UnH97OtayBz54zP90lYpeH9bPpiOprWAN53NQvB9Tr
         LgeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGYkiCXVrV1d47qk3hnsyNgA/U83LHIpMO/vvH49IRT2CySvgEWNZ8rdThCPzCTpYHebHNb3W97ukpzGwD@vger.kernel.org
X-Gm-Message-State: AOJu0YwZhKWp7nBP6WTAkdc2kJgbsZnAZhVcC1m+gMQeQFdt7ZI7Hbld
	0wvicvFQ2mKtHJS2JmsDUq7pxndCtQJuhtmU1nePw30/DcyoxOo5Q7X0B1ww0cdKwr2AoI8Ovt/
	kFYsbapOHT4VXxZ4K/BsIq8vd0dEb5zniiBKyteKSiZEHKuovVwvn/NT5GtZMPwUDaKGG
X-Gm-Gg: AZuq6aKpOuZvgJ3KlDWp4O8rRS/+oo//Ob0ym8FyzylN5FKmoqynCmo89WCL9FHKOyT
	9+47vSu1pT955kPHwPE3jSFFp8mdb66E9+yL8R3JKMDbvd6n1hd5/wuLYRMC2RbnEeAjVmMDTo5
	txXoDl5rrks7CYGgOmVKnecn16vu9VyFuBrMwc4yhleWfJaWv7ElKrbVurfIpmnnuZzv7oKcWBR
	kQ8eq7nOnVOOjKEi3Abim3utzhbRKdNXLhB4MBKWR37SuAwvwUQN9aQJjZoJhbnEa2UCNyGcnBt
	dCwJnA4FPnPiNHFohr5jjzD2HkW5EWfELZAKHxG5vHDQY2c+QP3T9EFctaN4+fL9yB5hlcJ2l0W
	CzMcxkwq/w+VfSC6A6RlGDRdgcq8r9LukiqPVp8fJyhi9lfQpUCzAnizblv+VnAiLM4b0/pAQ8G
	mKIqBOVqNMv+zOuk4ViqOZBjU=
X-Received: by 2002:a05:620a:3183:b0:8c7:8b8:e0ac with SMTP id af79cd13be357-8caeef2fa61mr444389685a.12.1770400046347;
        Fri, 06 Feb 2026 09:47:26 -0800 (PST)
X-Received: by 2002:a05:620a:3183:b0:8c7:8b8:e0ac with SMTP id af79cd13be357-8caeef2fa61mr444386185a.12.1770400045905;
        Fri, 06 Feb 2026 09:47:25 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44e25e01sm755705e87.91.2026.02.06.09.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 09:47:25 -0800 (PST)
Date: Fri, 6 Feb 2026 19:47:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 4/4] arm64: dts: qcom: glymur: Enable Glymur CRD board
 support
Message-ID: <e7czvhs2h2yooofqi4wo3mtuofv4ruzsqu2e6murktuokjrj5w@w5puyppiwwca>
References: <20260205-upstream_v3_glymur_introduction-v7-0-849e7a9e6888@oss.qualcomm.com>
 <20260205-upstream_v3_glymur_introduction-v7-4-849e7a9e6888@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205-upstream_v3_glymur_introduction-v7-4-849e7a9e6888@oss.qualcomm.com>
X-Proofpoint-GUID: SP8xDxmixCi10qbXxVCEvPAAW7PDCHJJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDEzMCBTYWx0ZWRfXztT8fbDUZkRI
 yE7g9ZFnGmOiRmb9abFrdPy3LOvIqfMz1H+euRro+bQT1mDM4oGPr12b0nZsY1Ekyjdk1AyFXk3
 ek0J7w3hEaR+jibqIDAD3L3GVPtLXSGjnIG78rJEQ/p4wvOeN63ipCde8Jmgzv6xm4q0xtBZABG
 IcnIHFG3y1OZOySLRaj0YRKJ+cAsNi9fUUoJw6bEWQAwze3EIDTwc+gFsA9Ho+yNgniyHjSdkCu
 G903gXq/u109dQypGWKIYvwadt5Nb3gc2sdUHF8aA4HMooG14Dsgwc33q657IFYvRJcySyJdvww
 2ysZZkUATW/wJxcg/O+pONY/Xw4pRrV4DzmHQgenPmifz5rQ/J+w+NRq3/OIscP/cbel+54ZFR9
 1qdWT0C4HSG8KqFiWCC+9HqPZmS1MIPvdM4Sdqail/HGO0NlTOFCnROAb2AdEtNkAZ97j4Kgcaf
 ggC4og5oKnetaMV7s+Q==
X-Authority-Analysis: v=2.4 cv=C73kCAP+ c=1 sm=1 tr=0 ts=6986292f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=iJjC-FjJdm91r3in29wA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: SP8xDxmixCi10qbXxVCEvPAAW7PDCHJJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602060130
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92094-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C6504101698
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 05:50:44PM +0530, Pankaj Patil wrote:
> Add initial device tree support for the Glymur Compute Reference
> Device(CRD) board, with this board dts glymur crd can boot to shell
> with rootfs on nvme and uart21 as serial console
> 
> Features enabled are:
> - Board and sleep clocks
> - Volume up/down keys
> - Regulators 0 - 4
> - Power supplies and sideband signals (PERST, WAKE, CLKREQ) for
>   PCIe3b/4/5/6 controllers and PHYs
> 
> Co-developed-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> Co-developed-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Co-developed-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile       |   1 +
>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 598 ++++++++++++++++++++++++++++++++
>  2 files changed, 599 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

