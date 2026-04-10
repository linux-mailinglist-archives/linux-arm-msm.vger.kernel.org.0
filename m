Return-Path: <linux-arm-msm+bounces-102702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NtyGiYf2WkQmggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 18:02:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF763DA04A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 18:02:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 19B5A30387D8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 15:57:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77C643A453B;
	Fri, 10 Apr 2026 15:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DdUAano0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GBcDWoo+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69FD3D669B
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 15:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775836673; cv=none; b=s1UtqEtjNVvEpdzYKTefWqJ3n01d/TjY61fX8DfzU8dEK0yWf95/rE23tIwJnY5GoF/tTY+vR1bKfLdA08I3N7LY77m0VcHxv6b3tAyneJBVfnOv8Fc094HkHBUvafZjeSI3kp9a7GLZt2SPn1xwdsxPMVDkEanNBCUitTybUf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775836673; c=relaxed/simple;
	bh=fv5OMOu1zNM4pDbfg8Pmy6EMQUZjpcDL9MDQ0YUeFWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m+ivcLrDfaqUAFHxTb60wUBxkbRluw/ey48QooqUYgrLzhiDxqYsc1DnVhK0kGuSGKTyu9vTDWxWeBZoOfXay4VjZSohfylga6Ziyr5/pu6f52A5EU5x0Opl6XwbhCXEibgTafccnpYdoxrvdVd1kM3HDsRdP4krkp/JVX8n0AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DdUAano0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GBcDWoo+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AA65Zr017527
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 15:57:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LqlI1O8H1DVEX4GBIht8xh6h
	Ovxmk7hf+alBV7/gD/k=; b=DdUAano0YtU1zUtJpvEimlyOh776s/+YXfnQMn1N
	ZxYdQeAWYYM5eiE0elyzYp29eZuJFxq9/OPqjTSEvDmuRNsDfTOvlkvmOTig7Uuj
	TvIj3SyMQvIx1pixzKoVYTmTsaIooL2f2/y8dB9WnrVjc36QQNDRcUk6JQzX+L13
	EY9Euh9MAnac9cLdDc5Nx/gO+Moc1Y4yFiXHkBBKbmkwmKtGUN9CIfqry0qG0F+g
	4/89kJcLPJ+NWCsI2lczA40OY7q7kUuHWVFnqUfmIhb8acAMxwHJBGFY5ruaccuw
	++/BbdJ3DtqiImhZjt43DXpsVb/iVH39GwNZBGu9RrlgXg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dey5j13hk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 15:57:50 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2b81ff82e3cso1109355eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 08:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775836670; x=1776441470; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LqlI1O8H1DVEX4GBIht8xh6hOvxmk7hf+alBV7/gD/k=;
        b=GBcDWoo+6C6DY/20EnaoUq2rD4+vH8WeJpX+VppmJX7o/0oFcNf9mumfwwmFM3Biqj
         s3mCtQcnzPgetuzrQQChqDDl6UzkpL2sf76fRVtkYPAP3u4TDzrcb45n0/0fvMWPbDxN
         gnaiQnAjyIBWv+b1IWNoQmIsGwlynHQeToa8gN0JuOEUFMZzYHb0HXd5Cw5A++yGO286
         6i/K34X8FrDjPTnZe9xHd4ovFHCzbHJYVHGjGSSvOLgvRmCd79N8Dtoop0quR7jiCmv1
         jMzWjIiXuyWuVEiQs63cnzL/sbteIRG8Wl7pXrinPPUI3P5brY+Z5uvFumGp11wryaJd
         cgLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775836670; x=1776441470;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LqlI1O8H1DVEX4GBIht8xh6hOvxmk7hf+alBV7/gD/k=;
        b=dIO77FxrcP0QOZkhLLMSh0GtJoD+nDDXzZnOs+JVNE76khEy6veQIOFJeYeudUA0iR
         5BN43v2RSd0JDXfrtnxgJMysuz3m0fDysMhMGfjUWm0OPz2y0yZmpT58Rq/08dHjXz9B
         bjv2tB3nCQxD+BtVH7dr7Wp+goeFnBdYrvbbeRzMDRvlDjVDGkSnPGRipFs2BBN8g8cK
         S9qqb3rLBU20UmjmrDfG6Z9v5QLBL68JQa+tHgTLAPBfK+g/7/Rfomc0NIE0rkqQ7bst
         n5IwMBZ5hvkW3yAY06/YB++Ec2rhqhbzw8o133VCpP+Q3MSDJze9OBxzpMh0TzbI9F3D
         Cp8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWSCODkuTTCo1X0S9evE26s8hDxSJj0/Wm+a4LVZ7dZ4EgB+ygiNqymATPdrRs9wCEDw2T8P++1SzWTUe5N@vger.kernel.org
X-Gm-Message-State: AOJu0YxCmGx7lTY3+lbBzyABnuqHRlpFrBQAi1tdCqN8XPX2OHvD3J3+
	ImMHd3+K/73nL0uV/nb1wYFgHK0NsS8knqR6x1/46kp7LunYc8BIJ5i7p6jaVwNDRH8v4aMB8CR
	AXwWjEOK1yeJMnVDINHoG0dtMXIJ3CxLHqTNvNsyYRPLtwnZ3fHiGX0j2eJCvD07/F2vK
X-Gm-Gg: AeBDieuf8Gt+kFl/s7cHcDTOPDL0ccYRFJw9BS3g3MNfOTBLQnMbUaonGyolKZuoX6x
	aM4yeJD4Zy8QN7X8JT3WlXfjQCLb6Feq4VVSSbR6FSeIlHdpsT2f45H4QUX7hdgLazQ7uaLPJjH
	pSxbkF9Z0YybNBt9Z9ipxlkH0bhcQIpvN2mymJ6HKEoVsaV375Dn8OwNTXIz6+HIee6EBo/0Nnu
	yqerLvmsiVog5bzCCK30R/aRnGLr6+L9Wd0TjY9b/k/p2no03CCr8f1RbmlyDceIBBLBXPml+E4
	rC5PrEiCxwad24koFyI1lkycIVbwYBF49wKj4NBoYDIAz0V0fejkmSCOuE+ENVZXJCzHJbVNc+b
	QA7iGCHWGP+s1fX9sJ4m6EY2FtrdUcUQpvNhEiQD69ZclXXWERvB2BqjM8IlZewwxwoOn/fnR4r
	Q=
X-Received: by 2002:a05:7022:793:b0:11f:1e5b:2dd6 with SMTP id a92af1059eb24-12c28c30fc1mr4140101c88.17.1775836669562;
        Fri, 10 Apr 2026 08:57:49 -0700 (PDT)
X-Received: by 2002:a05:7022:793:b0:11f:1e5b:2dd6 with SMTP id a92af1059eb24-12c28c30fc1mr4140081c88.17.1775836668991;
        Fri, 10 Apr 2026 08:57:48 -0700 (PDT)
Received: from hu-mdtipton-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c346eb314sm3734038c88.10.2026.04.10.08.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 08:57:48 -0700 (PDT)
Date: Fri, 10 Apr 2026 08:57:46 -0700
From: Mike Tipton <mike.tipton@oss.qualcomm.com>
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 6/7] clk: qcom: clk-alpha-pll: Add support for Taycan
 EHA_T PLL
Message-ID: <adkd+rbJZom/BLf3@hu-mdtipton-lv.qualcomm.com>
References: <20260409-clk-hawi-v2-0-c7a185389d9a@oss.qualcomm.com>
 <20260409-clk-hawi-v2-6-c7a185389d9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409-clk-hawi-v2-6-c7a185389d9a@oss.qualcomm.com>
X-Proofpoint-GUID: E54Yv6dQD8Dt6qFwVneSpe0mO3oNJ25Q
X-Authority-Analysis: v=2.4 cv=b9aCJNGx c=1 sm=1 tr=0 ts=69d91dfe cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ejiLYX5kVw-NK1-vaKUA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: E54Yv6dQD8Dt6qFwVneSpe0mO3oNJ25Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE0OSBTYWx0ZWRfXxRci41hX1DpI
 ezvsWsauhg9DamyZRERKd5QEOM4P9k5U2CG4Cxsl9rAzpDrXiUcxELjFJ15IG0ECbUsds6+k3Pk
 MgDJ2gWpgXn2+PpwhOV6WeAAPiZPVh7CObO16310Fh1SWJW0SJyl/dPQwxeVmuZ4jekcS8TmLS/
 ubXCFiLWEc7aDN71uNAlo+QzXueTXm02S9hvo2OyTU4GPUbgu0wttT8JnsFxnOIF9o9F4ioXhLQ
 4dX9oQlKevL6faf9GEaHd4PJQLyOxfdsfwuY4YUiaIcI185Qru2JlY1utv3gu5BmtlAJIZNkAGd
 qARgQGG3ZZTKLDwoNv6Tlpb2Md76/TOytOFKNz7RjXz57bxyFWlTq5zzjl/22QCgUSm0tX8BlIM
 vF+ySRWQGoEOwSt6ToAXW+aw4eq+3r7f4yTUDHo8Oc43i3T5Eq0LXfgcaZI210t2vu0akycDpZz
 gqGvgtaozReHc+YizQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100149
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102702-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hu-mdtipton-lv.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mike.tipton@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2CF763DA04A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 09, 2026 at 01:51:40PM -0700, Vivek Aknurwar wrote:
> Add clock operations and register offsets to enable control of the Taycan
> EHA_T PLL, allowing for proper configuration and management of the PLL.
> 
> Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-alpha-pll.h | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Mike Tipton <mike.tipton@oss.qualcomm.com>

Thanks,
Mike

