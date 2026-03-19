Return-Path: <linux-arm-msm+bounces-98759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id //f9LPz3u2llqwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 14:19:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB132CBD64
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 14:19:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B440530215C2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 13:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD4883D5221;
	Thu, 19 Mar 2026 13:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cx8lbs8R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TXwO/T1Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD523A1E70
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 13:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773926353; cv=none; b=s6NCBZSDxG5ecPWQkkZS+qF6rbdgjRN+0//s5e5d/SZhl89kvvzMb5CndreMscUDcPdKVQxQApEAu8MezIpFpYQqbi92m9vajjzRGURuYVFqx8YF9B0GhWfX7757zQAE6YLRGtHwVSBuvjWUneTeTM0FykO5a5lRcri0vNQmGn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773926353; c=relaxed/simple;
	bh=HSwFzGZ9F6bb7nLotJzF7IdaYo8L9hCiC++wArQI9Gk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V7dptqgsTniO6AQfatuCfODX5/g+BVIPwO84lECTLqg9KBBx41gL4cTqVR5PjP1ZKB863lW4QhfS62HfMYtMQvjYSIVe11tLXK78oNBeII0l7E4CXZrwWzmVO38x3hLHA18rAYUXjgGWBwGqdtbmK2D5dpvlvoMd3oaJoYNIqmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cx8lbs8R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TXwO/T1Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J740VW770562
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 13:19:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jcgutIDYP3LXPrjhG3INGWkL
	LRobk4AN5uy9lV6AJrk=; b=cx8lbs8Rfyf4b8hKowF8qvHDfS0k1npzXGz3szQa
	OAMNqC02dNvlhfKdBXsZhYtvWogO9X+PydQ64vJ136MWjvGRbmRScP6h/ngKbj2t
	7WpryHb7VbQK52QTYu2tNqinFjfxzDmCACzXbIA6hIdyU7ywOfW7FyL8iWvADXFt
	SCPdGUIPhY2UaQ7N9HRdAQskg/EdT0lOb4fMsdPqWcyQEwT+pz5AjkgUPGCIQIHp
	Usk362MEr/1c+f2WbMj9RI2CSAB97P/FNl2esyJ6yBr/JGZdDYboUxgPJ1CkBSzQ
	6ijtNSaUNDVPqK5JbVrqQTxTJ8izpYpKnYg5e4kUV4KZ9w==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d00egb86g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 13:19:11 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-950d7edd910so1390976241.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 06:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773926350; x=1774531150; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jcgutIDYP3LXPrjhG3INGWkLLRobk4AN5uy9lV6AJrk=;
        b=TXwO/T1ZVZDc9wHYwpLBZepmiO8lPpGRJZM+YX5heN6Wphn8U8Ov75XbMkedcDiwZy
         SV3R1mrjNU6rZpbj35/VUHbYzrmsPk2qi6XsjTBl+uUIAe9b0DCs/hbmQkJjUjEllk/Y
         nEhS+Db6T5oxsk/zX7AYNlbslwe/8XEwTc7zqAhij5v3LVNrepBGVmmntTlHk48yc2m4
         MfjwrpxNLZjatprkYxgAWaCq+sk5tAC4TjjY1/1lAWiXF1yMmgzUf780jLI25m79xyWS
         Vx8TOB7cQU31BUygZ1TcWEjvnExox54+riBSSCJBKJQs/2f5D+eiXh39Un5+kRHaO0K8
         SSbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773926350; x=1774531150;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jcgutIDYP3LXPrjhG3INGWkLLRobk4AN5uy9lV6AJrk=;
        b=C4m4FlQtIc8HEBTe2hwBXO4U1wpg8P5z5XIbCyG8Puzgc6x5JkeghCxe9gMtuf9oX9
         XP3frmWRS+nHUlW+Ul7WcrsDDF7bXhXgEPG/n8tu1BJxLHwOa7dXrVI8cCgvlozCgxZI
         5oILaXEEHZK5A8CTjdBLbS9+CLgsyNalnVImM/b8NiGsEz3LWl1KFC4W7oDRXhE+H2nI
         Z9eImCc295nLsNPqo2hCCToLZFxc5KjbLVlveCDcrYuTaFh3WchWqH+xQ7H9QJVt6ys1
         An/51RhIWyVSqD5f4Jq8B8Uz7Yvx+TMzMxScjvvtuIDYBOfYR8K9tZHlCwwSmSUIJHMq
         MTEw==
X-Forwarded-Encrypted: i=1; AJvYcCWiX/kePWIbUNyhGDKiYC5NiNjfjllI3k6iS4NbNbDhHdodKODaW31M0RDMpf1CA9zj79U2fA4Hhzdvd6s9@vger.kernel.org
X-Gm-Message-State: AOJu0YwRuS2NvXeKvdQ9st1YcDS1GWPsa46akK4OEVCkRQkDXPsZNJ/9
	Pr8FV9tgc05NpeYjraB+bk3/ouLhOR0NV3DHb7bLk1s5rB3N2TuE/k0eOPQzc+Vd760wFt0avT1
	GqBhnxt0ZML47b9+cU/YUUFEv8oYXdBgh5Z3TlYLelpL2mTAjJ8s6w8xysMH03y0Uk8Y8
X-Gm-Gg: ATEYQzwpyduTRLFgpeMig20hHOOMot453/UXP8uxEeyDOT3HR59GKoqqNXeOMDvddC8
	/eAXffSLTVufQ8NGNTexa7Aub3twJAiRvxoa5qmovqjNdAheskA/hrRQNR3zHd01O4o4AP50b1Q
	FUs0qF0oOUOcXBYQDgUj5YHfMlDXsBVluLzLzrtvbeuVTBMvLtxKh0PM1Tk5fbeA3IGYEhbPZRF
	kvZuRl1D4iO8Mjv3pb2Tsr2DQ4dt4S7DO8NTD3cwOkjeO8JJSSddxlX5tG5WxvyifWA16TDDMmX
	BXHEYTcMrgIEOPywROu4h5S3PXzQWhegDbc1QwV2KVykSTpatFrqPre/OTGuTymBs2QegNBSp3m
	ixvHqbupl4HDHB5U0soIry+2hG2d9hOQToQ==
X-Received: by 2002:a05:6102:e0e:b0:602:6987:e22f with SMTP id ada2fe7eead31-6027d3f8fcfmr3204775137.33.1773926350228;
        Thu, 19 Mar 2026 06:19:10 -0700 (PDT)
X-Received: by 2002:a05:6102:e0e:b0:602:6987:e22f with SMTP id ada2fe7eead31-6027d3f8fcfmr3204768137.33.1773926349674;
        Thu, 19 Mar 2026 06:19:09 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51892273sm13410397f8f.19.2026.03.19.06.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 06:19:08 -0700 (PDT)
Date: Thu, 19 Mar 2026 15:19:06 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, tools@linux.kernel.org
Subject: Re: [PATCH v5 0/2] arm64: dts: qcom: glymur: Add USB support
Message-ID: <aknptlixo2vthjy4dxgfsnmrwxhs5rgc7seqmpkogevfkzzqcx@vwnu53hx5ppk>
References: <20260319-dts-qcom-glymur-add-usb-support-v5-0-b1d9c03d5f09@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319-dts-qcom-glymur-add-usb-support-v5-0-b1d9c03d5f09@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=MMNtWcZl c=1 sm=1 tr=0 ts=69bbf7cf cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=8EIStOlnW5gHCOv4-VUA:9 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: rc7aattqa-V_PVtwPSg-j8QAWixipvsN
X-Proofpoint-GUID: rc7aattqa-V_PVtwPSg-j8QAWixipvsN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDEwMyBTYWx0ZWRfX8L+HR/DbVQdz
 aDLWOcLZByrKpHLGjgYfOVE66uKQgV1tgoESpCXBx/sayB4XXdX6s+UFAgJ5D07Go3bdZwYImRU
 0j3tbhQDKjF5ihAx4gVFesw1VagqZzsj6ko31iO0WdVAs8/mtu0IOmRy4/2r7P7H42OpK1Ep/JU
 +EIN/Atnbb/1hAwaEqLkh0nIJEMo7RKrzJAKVqNMsAZUrn5y4b2FPwz1izQRgRjTI91P5hqWB02
 jhdHfCWo30/1TQeuONAtI24vzYI2qKOIKs2UdGSu7qiNYzJC/8VoRzc1u+kRO8x0+eR6OeQhrrJ
 2kMvPGLCkSdaIGvyNjPmQnblwKTQagXzoKeSV4DY6obdO5sb4v1rIaew9HyQ63DohHMoIX3jw5v
 wo7U+zAXLorkqzUHifTxWXqLCvgbaQEa65jFCq9j4d0PrYo/UdaM2eEnClgMOzV2POWGo+CqIeB
 SAuuXiXaxDCNhIceyPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190103
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98759-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.985];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BFB132CBD64
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-03-19 14:36:43, Abel Vesa wrote:
> Add support for USB on Glymur SoC and its Compute Reference Device.
> 
> This unblocks the upstreaming of the display support, since 3 DP instances
> rely on some clocks provided by the combo PHYs.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

For some reason, 'b4 trailers -u' didn't pick Dmitry's R-b tags, and I
didn't double check it before respining. Sorry about that.
I can add them and respin if necessary.

It might be because I rebased on new -next and then run the 'b4
trailers -u'. But I'm not sure.

(cc'ed tools mailing list)

