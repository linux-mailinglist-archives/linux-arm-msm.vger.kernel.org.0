Return-Path: <linux-arm-msm+bounces-95247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGxKA56tp2mMjAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 04:57:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2561FA8AD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 04:57:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A30A6303DD4F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 03:57:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CED037DE9D;
	Wed,  4 Mar 2026 03:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CpgL03dJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EtVuuAmZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17BD534D90F
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 03:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772596635; cv=none; b=GlaSHMfnKfYTz5xO+7H/rHiXvflS/3wRWx4Fdr+3ZKcHsWJhuZ61avy7MJmgx84KDbw8ASvbOfhxTrK95RFZe34gSVpmF4zKHwJ0QHb8a4Suf37N7STdNvHoaQjNpV8Aol0dWyFFQPNSbCnk8yiYwNtXpDm/usjpeUpCCSBT1U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772596635; c=relaxed/simple;
	bh=hYrGw9SnO50nDCKMjQLbwhp8JgOXABbtrMVdWcK3DBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oWC1N7XRuThN/XDQmhBFEEvWaMEwJjBaWdrdJev8bHR0W64oyJreFacS+7BLGladJEqFogFBPckEFjSoyMNwxkf1bdLMJtBUEARMtlj44OGWndJ3zddrUlBHchpau3I+MNyEuK/SMR3r6BT7s8vaDeU/OpP4lESzXgHMr9ixwDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CpgL03dJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EtVuuAmZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6242Y2D73548601
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 03:57:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=issDwTTs0+YcI+syXy9krVtq
	LG+hmBkYoQyEcjmwSE4=; b=CpgL03dJhlzfOUjNwxYZoD+QL1GPz8u1krJRP6Jw
	PWJmY/uTjH7Qnyqk7NCEpR/iKSwzXMFYvVOxRklYFkRymVWFZr1chDJqm8XigD6E
	/6XpVEkJWJhHp/8UE1lWTO+l9E9ve76OQS0QdCNIz1UQHdMSAcNJTuxK5BTCjtEk
	H+NfS47GT97sWdcXaRE5u49bcNW7nBltNCZalQb9ea3e2URiHwywn5Wx+92gKgO3
	5XFF0iSGozaUnzRxdUIylesgokPBbDGErHoxyfzjUfbID8UWe3SNBQYJMJuIMhbf
	BCqfPguMqdfR1UZg7IhjsVl2DP5oAsFmt5Yflp+O6WrZ9A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnvxfbef5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 03:57:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c881d0c617so3901575985a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 19:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772596632; x=1773201432; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=issDwTTs0+YcI+syXy9krVtqLG+hmBkYoQyEcjmwSE4=;
        b=EtVuuAmZVoZWshVdG4vI6ohxlnyvZPQpMSrLtpSdgrwa7HXs/6n+O63H5r1B1qHWgC
         1MkD2AEJFRVgq03k37lSseP/AmLclVRs3y8meOtIEZU2V5r+H8hPt+bt94Zj0DDo51SA
         EOLzOp272tU0At+UlMQh97iqJ67Xj1K3+AfVU/U6Me1jTfv65i7aIenI3ThRmg16Jbnu
         UccOzNxRtJiy3GgcuAToaGQ4eyyaC6eTs5+YSmxQVQdLC8jYCG6G9lqSgSQfMw4uZuhn
         XSVi+j9qmvUerexfid3qEIioUMkrPOzRHWhvmRpPjDTnYKYATV87zBh25MJYQtGqQui/
         CyMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772596632; x=1773201432;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=issDwTTs0+YcI+syXy9krVtqLG+hmBkYoQyEcjmwSE4=;
        b=iAvmBHsVyh6m8ckgbHBIhiZ0nd+2+xs3K3ZxdNP4mM8KiHp1wDz/Vwti29DbMIH1r8
         CGPORfDccMWea1DDIeBC4LM6ermEedF4OBY2WgBqNhwxgfWykCLFu8LEQf3O1yYMRv9V
         lNVNepEeryX6aCKM/Cic7jto1m3KakbJTgXC8+d+ALUWer8qg4sT7zItDsyDb8434Nzx
         7UOSbS4GOj99sqWmuo+l/6Zi0ChUhQ0eMhbNPlfO4GDlg4iQrOaFfDJE1FgIKGODl9o9
         S7msbZEm9WSN9sw1YBZkM0d8Cb7mZUMmhO5JZZmhuZFMqXA8y3ZcwIevM26g/Fh1AI0w
         Fvdg==
X-Forwarded-Encrypted: i=1; AJvYcCWyQn9H3/RrMpl4D2MASYa4iChraOKrEt/HE4CnnLoeg/DLaUxYAcrQP9KeEB//4C1nSxDeP2VN3HxQHhhc@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8FWL5hDsuOyP5RuB9JZEC5GI/9nXX0kxvG4cXjYds7IPj1lCc
	llw57rJPSbfHQnrjTmLP4yIjxsPivUyzR48z7ytMBdOEhhAUtAAiBKwsKOg96F31fnhuo6WG11o
	El1+B/NYTZnxe/Mz6ATIWgtf4auxIb1AnQIPEzhSOphQA5RLhXJB66pWIFQK6Jt9H45b+
X-Gm-Gg: ATEYQzz2sPh9wqZMQQrGMsoLgtir9CPM5jTSQDaFzVFb6MdCuk5FoxMbc8iK2b1j/YV
	LlYpz23GXnqZ4iRf/KNa4XbMQV0H8d867EwbOdf5Alb/00GQ9tsvyonQrjl20uJcI+cwxoybbY1
	HkUOK44j4DfAiDNfCiKyNLXnWI702heoVBi6XF04RW8vdYWOG0GVyMtuHQKxECuyXdB+4PnghhD
	+VI6BlbrfgnzwoaO9ANNG+m1ELrQwfoV45E4ArqgrTFRQSX3A3eaz2SkQGWEye44RkgjvUwcI58
	H9WT/WXYzPIfR03YAiRIQugRTrY9EVZ6dlwytlpp0sXnaoiT11xS0CSG0vWkiW6syf7rHw9pOg7
	6uycgt++DWWGRCBgzv9OJNz6IlOv1T+UrvTvfr2U/4V/hWQGmbP08f5AxargbhXbbtzMrY/KVIf
	qcy4wbsmKyK++nE0NOMQW+tcPecuD9uhBGNCw=
X-Received: by 2002:a05:620a:4481:b0:8cb:6b4:7007 with SMTP id af79cd13be357-8cd5afd23c0mr83421185a.81.1772596632295;
        Tue, 03 Mar 2026 19:57:12 -0800 (PST)
X-Received: by 2002:a05:620a:4481:b0:8cb:6b4:7007 with SMTP id af79cd13be357-8cd5afd23c0mr83419185a.81.1772596631936;
        Tue, 03 Mar 2026 19:57:11 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a12a6e4c01sm217909e87.1.2026.03.03.19.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 19:57:09 -0800 (PST)
Date: Wed, 4 Mar 2026 05:57:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: monaco: Add role-switch support
 and HS endpoint for secondary USB controller
Message-ID: <d3n5pvjmxu32y72adukmeortisfftovhyybwih4xgfjbxbnk2r@gblewcjamp3i>
References: <20260303082157.523847-1-swati.agarwal@oss.qualcomm.com>
 <20260303082157.523847-3-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303082157.523847-3-swati.agarwal@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDAzMCBTYWx0ZWRfX9NVB5B712nKD
 QxZCbrL29PuLPX4UnKwUOKvqj9+T85o2JMZn1a+eDJYqvAQsk5HZrLb2Thp7Lm4pvEQTXWZInAA
 raFZXm6JXyfnYHlwEJ4w+7A57j9v9fHvo+aCefJcfE8l4h+XHVVBF2fqf0r/I42zTzzgy7iFTfa
 lO48BVSsLiHz5wuvQ1b9aUgtfuKsynD5Qn7DZgHIpfNO2h4f2XC9ptRyZ42o5IQkuXzGb0Ap8QP
 N58cwxRbQOBLnWyvq0IvMxp952eXcSgf40fS18/Dc4bd1/kVIzsx2m/7xHJcptsIWOsBjLNEvBq
 dzssDioHeqQlKgBNHzI1RLeHzabEJEA5RaMsBF/jN/Ckb6wcMRiXEEOi807vu65lUvC/rAUNRl/
 3qOLLWCN4x2CL3nZVx/lLoVf0jeWEKMRGlypk2qWpRvw0olq5ytn+kC75gFoZ/zPEageKcyeD4c
 /owRJLk+gXo5+uuw1tA==
X-Proofpoint-ORIG-GUID: ovYiB3IBje9Dfx-96EdMlRPHgyLSu9zy
X-Authority-Analysis: v=2.4 cv=S+HUAYsP c=1 sm=1 tr=0 ts=69a7ad98 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=Fc0q_dUaYLOeU87dcmQA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: ovYiB3IBje9Dfx-96EdMlRPHgyLSu9zy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_01,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040030
X-Rspamd-Queue-Id: 5D2561FA8AD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95247-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 01:51:56PM +0530, Swati Agarwal wrote:
> Enable usb-role-switch for the secondary HS USB controller on Monaco.
> 
> Additionally, add a port node with an HS endpoint so the controller can be
> linked through the DT graph to the corresponding connector.
> 
> Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

