Return-Path: <linux-arm-msm+bounces-96380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMg5GL89r2mDSgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 22:38:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A25241CF3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 22:38:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 328AB30EDE28
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 21:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6D5636C0B5;
	Mon,  9 Mar 2026 21:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xx4VO8xd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g91xbJGa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E0A340A62
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 21:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773092043; cv=none; b=G6YR9vMWs+ZI6wg5aQEwNZkDxld4p4UaeCC6jG0RDcHJOwPYc77UnwxrUEB2y94n59wb5Vuq0T2r9hF0UYCsHjD1nCcTwFjYpxA6shN3mi1Q0ZuFL0/8WaqVztnc2Puy69uYmomluVaCp7oghD9rYbsb2f4W7Kt3LgS9Cxi1drQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773092043; c=relaxed/simple;
	bh=reqmekH/iSpybK0ABbh7C8SmgHE6GCp94aYa0M/nO4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lEh3l1v3IrdQ8sZIL5hlBvXbm8orowYB7zBTegn7ZKyS7t3joo3959mMS5NhKGrzfJ9u5MVf4UYI9o6Mw6sBTuTPPGHoOwMbw5WG3OLBMB9zIG9YhiqgwHkxmf1TvipzgYZuAKaEdFJh/UB47Yq4ckeVfkKBBDv8KC0WUKfsBqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xx4VO8xd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g91xbJGa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HC0eu744374
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 21:34:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hULBJxvAuvZHR9djX0lRgqPU
	HI91tBQCIAsTIDg4GJ4=; b=Xx4VO8xdWLlyzhkob4c+ef5wup1XxO+WulPfqk2L
	+2L21TNGuRR6IEjPYTz1+dFaP7M4mcLup4hi9emhs/ANMX+a2hfvDGrNv6twOsXS
	/1n2kuQf2uqLbIi+4NuwG7XnHZFgyAhF1EZJpS5RTepaegWxbs62J9NQkJ6cuXoy
	x7UvMtapw5qHkFtW66Qf9dotoAfbbD479Nl0jGVnJQ1XYysUL8qNw+SDXc856w9x
	8BedvvxYf0CuSkHVtB0U3BtLD1/1D/jj0fxR23KF3eEnYQa3cgX0TSyQC5HsLWX/
	z0AqjZtwMqG1umYQHeNQwFTRvxzAYhw7+iJQSp1NuMqbVg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cstsaaj2q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 21:34:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd85e08fddso1415731985a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 14:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773092041; x=1773696841; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hULBJxvAuvZHR9djX0lRgqPUHI91tBQCIAsTIDg4GJ4=;
        b=g91xbJGaTty3RkELkEjOOG3vLKjPGvpMpvVgVBYakgsCkZDUEOb5ywODsaE2m/en4j
         oH+HZ/ma4f6HsUpyXLNxoedb9p0+RQevK4172NUjIBWqEHwGF6ZVM1NPNk05wJBUhiMD
         wNbgVZ9pwGxbytYOWujdwfwtGPmbV+Zp2ExEjaHdqhSB9fZveGkQZmq0qb1JS6efU8ss
         BF1tnCEuqkAfIJAXCZKHGRjzHXnMIUk2KX1HshLW1Xh82SokDzesjqekS+hTqmMvsirs
         WiZD1//vUVdw+4iSKRkWrQqY9whz+wHJm2+BAmKXkXel8mfQiigYwnOX6YXTDXi9NcIJ
         RW+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773092041; x=1773696841;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hULBJxvAuvZHR9djX0lRgqPUHI91tBQCIAsTIDg4GJ4=;
        b=pt3eaQH0XaxVR27YXymvubY02I5SyuRm9gV0IeL4Tmi4e+20Pt3+FbeKCVKMPgB7Hb
         yerhrIKQq9IxqZdB+eWZOKmpxpXfTKgcVX5DiClWZZEm/rx7Rg2L4ijJZHAhrWkyyhrZ
         min8n+AxtrUmIEoEavvjycKYpNXcnoRjO9gFfKyAJ0ZhWIG9MIACBf4OepBcF9DRVZUi
         rcWvMnmoJujLYG9ngD+A63TygFAtNV3H0jOq0VEJwaP/YI9JK8ub8JLfrnB7rcrmiWhm
         XVSlLgnAD1Xl0EFIByX53qB1KTMZT6YoMTRYxBqBiBi1XE1+SautUHq0WL0d9BgSVgb7
         6dyA==
X-Forwarded-Encrypted: i=1; AJvYcCVqnKr5+amWnY6XR4FZxb69Y/sdokd+l5Ri6LAhkF03S5y3K48PPLJY2RbYoXNC2Byp3Xc/JYIAI1b7uSu/@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx3SSSmtGqDOnMxAlxD/PXtGbKxIeBMpaLwNRQpONBc0wD4Ker
	h5SEjY3GEnewL6yxG1/CcspJ8b28fEsqbag5hxj8O5buqYQE//qqv+Dv6WaO+blPkluY52Tu/7R
	z3QHamNkvZJOzJmfV59o0qUylz2gYlPAdKTTeK4uuDR/+b9VVsE4huJF3onaNYUlG6pJw
X-Gm-Gg: ATEYQzxtmye/apgpGyBpUdWXsD9Ti47Fdqum9sU4lVlRLSjfLptKSQLTouK8oFurB9W
	RcsI0LVpcLcGeGq/GPIsWJvg5SqxgOHHfl4G5XqTkz2f9WBkIKdebawyCZQaXUe0RmtEjO1OyOi
	Q7uFXNuW08e0BnvHgQ/BjKcGWTVh7Y66LCMdK6HyeSucIq57L2B4TU4E/a8YFaYFyJ2xrXlvynz
	r0rSwkdN0acSow2ZiQMgnRRhTmm8EVg0BO3HqNF9VckpnU1IYJfEWtOpATXrDKaDftjLytqbUZi
	s3HGl5eW0Eqqv3pxGoyjon54ODAlTwwz61IP5QwPZ2Q/MUfBaF9TVmBSgTJ70zftaJ2RvaqUegH
	bavE8BbhxSPHBBf2dXEjHqxVpXwUh7VfNSRZSsCq5oejdCUaAtjoJ0mwiFqvvpxCCctV2/aEnLV
	YCNqr9QnQCqIup0H7EZ4Aqxk6x18ASLsh95xg=
X-Received: by 2002:a05:620a:700a:b0:8ca:105a:298f with SMTP id af79cd13be357-8cd6d4ec9b3mr1623736885a.68.1773092040793;
        Mon, 09 Mar 2026 14:34:00 -0700 (PDT)
X-Received: by 2002:a05:620a:700a:b0:8ca:105a:298f with SMTP id af79cd13be357-8cd6d4ec9b3mr1623734185a.68.1773092040360;
        Mon, 09 Mar 2026 14:34:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d02b860sm2360342e87.29.2026.03.09.14.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 14:33:59 -0700 (PDT)
Date: Mon, 9 Mar 2026 23:33:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 2/3] arm64: dts: qcom: glymur: Add USB related nodes
Message-ID: <secauapnexowr77eoxquyxvbzu7tokd7lpxfo24lle2ktvtgpv@p2qpnvqywwqt>
References: <20260309-dts-qcom-glymur-add-usb-support-v4-0-6bdc41f58d18@oss.qualcomm.com>
 <20260309-dts-qcom-glymur-add-usb-support-v4-2-6bdc41f58d18@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-dts-qcom-glymur-add-usb-support-v4-2-6bdc41f58d18@oss.qualcomm.com>
X-Proofpoint-GUID: xnvgM1lREsP2vfwkcGuVeCbkVrDD4PVY
X-Authority-Analysis: v=2.4 cv=I+Vohdgg c=1 sm=1 tr=0 ts=69af3cc9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=o_jz2lA9kCOULBL2u_AA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE5MSBTYWx0ZWRfX/xDSzfVYsx6K
 Iew7ZtbWyxsE2EFi2xAtu4YT8eU5xouXHCEpRoiDkCBOSQNDZkIFXt/5vDqJjpfMQY6gP9euB4o
 EKvt2WOvu+gh1DY/GRfswcT1cGYkNFJM3cWizzNH1SEdCqPY6aG2H42/sZ4Re584vc/N+nJ6CkC
 k0mqTjdzaC0v9zcVC9Almz6guCUA19nPcc+zUN1K1WveuOQP/MFG8WrhFBK8n23ZsRA67YfPsxX
 EfHOKpcmRWUak50Uhp9+eHcBJaBsUudfZ8gkA2NUBpsMXrgcQZ+hT7NPent9FkQ3+IC9QmR51N0
 ekSQnt3wwlffIBJIj5EhmV1o/97zKtWuDMvwXlR13CGWvsxTehWwi+oAYLowEvI1rKKJv7kLKu8
 OU3MY5Yo/pLyw+b4YaVlvbeaIfWRCWKBj5tl6zUad6UIhHgwh74uLg5HfLAN2KiaLtQS9xIHCa/
 zZwGcp1Zckd+9bYVSlg==
X-Proofpoint-ORIG-GUID: xnvgM1lREsP2vfwkcGuVeCbkVrDD4PVY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090191
X-Rspamd-Queue-Id: B6A25241CF3
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
	TAGGED_FROM(0.00)[bounces-96380-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 12:56:52PM +0200, Abel Vesa wrote:
> From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> 
> The Glymur USB system contains 3 USB type C ports, 1 USB multiport
> controller and a USB 2.0 only controller. This encompasses 5 SS USB QMP
> PHYs (3 combo and 2 uni) and 6 M31 eUSB2 PHYs. All controllers are SNPS
> DWC3 based, so describe them as flattened DWC3 QCOM nodes.
> 
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> Co-developed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 691 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 686 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

