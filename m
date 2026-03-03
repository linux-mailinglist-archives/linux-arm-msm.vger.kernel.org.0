Return-Path: <linux-arm-msm+bounces-95221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFhLIQNop2mghAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 00:00:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3531F83C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 00:00:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A876B30AEBEF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 23:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50BE2390C88;
	Tue,  3 Mar 2026 23:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WJIqvp9g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="areCwi88"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F8E38836B
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 23:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772578809; cv=none; b=frkr8mSc6DSMoYW5K5J63vMv8lGXTN5I/qJ1fxlEGnhQPHwgz6O8vCpQLNTh/EEcYrQbON3yojoLqs3CMDyJ+9KymjyBdY8J07LxASJSKsSt0tGeem56xlvda+41a8OUASatTgvJrYyOvg8AOv3D+37NqXRkbTMcOYCHiDW33LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772578809; c=relaxed/simple;
	bh=Nhrqoiri5fTuZmczsSl6y0eI3VbPPuVRJfwl1ZSTp8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rFgDczips7ftEjMFzlUMDSCHG9s8yFzEEtJJOSSHARJEohnvQ6Lp0o9bW0ZXqFe2gR4unXHF/AaC8PyqhBaRE8OQK3N0EJQVgIHfiFvFrwkV61dN9FnEFCyHF63KjyG0R4ELaZX9Ryv4zMQyXbiEkJkOjfelgR5VFpQgTnzU/sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WJIqvp9g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=areCwi88; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 623H0BOd1256225
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 23:00:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=exUThU/E91JvpjCuHnz7YlMC
	3d3F1b5wLUV4HfYBPC8=; b=WJIqvp9gyPfW1NAC1UP19Aprb1pEdj7X2trin3KW
	vXnzDQddzj0nzkD0+1sC+rTe6jDUvMKO89rOjy1PNFgRY2V5D4MROLejOvtIC5r/
	dPS4Ddlp5G4vN6wT4v6egKKWNh8F2nRyVbOJ5qJZ/AIEGWiF7BzFIdOjdR5414ao
	G8XoFXHoE/XR4yXceZMHKADGYQWitUDaRqH+7niUFCIi2Gucu4/ixH7y0A5pxZOk
	Dn7M7V+V2UmiWfJUfW9fgX7leSYWsdPN6ekP4vUnfrUFCIzMqTdRWLF+KONTTBiw
	TDu8jGjxBsCWXefb8edRhcZsM8DVkUfRTaD52m5y2Wv+PQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp2c9hgu9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 23:00:06 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-506ae021853so76178591cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 15:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772578806; x=1773183606; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=exUThU/E91JvpjCuHnz7YlMC3d3F1b5wLUV4HfYBPC8=;
        b=areCwi88kgSrZXuwLFRuM3KsK2Z5xpXYii1T+hqxcKWDnpiafkBZnDbntdalikYlX7
         RHAuy1CUU/8PXwuxH5ZYMfQaUO1ViPn7wTtku3e5Pa2/bNpDN1Fl66vQJKUw0AGP2fPP
         DwyPxHxJs4oJ6fC8v1HeeOewJqcxm76bituMEtSnkDkLe24gShaPY+/lubjFxTML031y
         3rps50++N+LUtzep5Xn82eVC4+5SZqe/L5MrnoawvHObyCf/dTqwIhY20Q9psoXSbyMi
         rLI48rsaclhwgBeuJlYhARsK8I7RY7dwV2JSoI5HKg9iJZQXnzD3InqaZ/qKZPW9A1oQ
         g5Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772578806; x=1773183606;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=exUThU/E91JvpjCuHnz7YlMC3d3F1b5wLUV4HfYBPC8=;
        b=fr4TnJj9H257NJRd4529TkMWJZS2DsFiRztSFgoLWirNe9PGyOn+AwXzwydgAOCscE
         dOjO5hrILgqdyM5dotQkTbSoRXol1HJdes0Yj61BDraloOs8rxEVjHbEPUf1Jgk6+wzc
         Nvai68mvTLReoFolY7h1mlobYgB82p03N/mW7ftdKXaWxfFivPUDEhEi5By9SI48vXZo
         Q3tes0QZijWlAbEoje2AhjBxVidRFwJdigwub21EdJh03PH3K5pSgN4JogrmwoIBlKzi
         mOCcxUCU+V9cyQy6SbaYhKTTs4rdNpdm1Lqwq/LSca9rlwkpVRz7RfPD2iRBc5SWtg08
         dZiw==
X-Forwarded-Encrypted: i=1; AJvYcCXcBpKwdErevV6KW7TpjHTMig2jxjYdarhg3ZSZamoHONjSXVzxrffZR843kTlL2SdenYDKTsLBfzHMO/IZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3aIYFX6jgW2VfMd5Nsb/oU/r+RL+SCtd+b0C+Y9h2MvyltfV6
	7bGQQ0j3+YOR8Y0fum3WKimZl3f1o8nh59U1ZkDlVPu2RSQt5glwGyR/ak//VNArj9liIm/VTz0
	okYiJM/Y9fv6vRg0CkRDva6FH60jycSKkR26hy6M5sIYYtZ0jrm7/wWNPS3dIzjxiHka3
X-Gm-Gg: ATEYQzxR+91wUZYMWK6b3B6zw/2Drp2U7CiZif3oAlZVNNzxQhzrdLXWlP7Oi4UMz/u
	dEHR4i/mX1fMAgyRRfl52cmVTspGmNxx9/IG40uLt2HZdYvXuabn8/Ni74mab2nO1b5CNzDFYiE
	vrlobKw7L8pAnpEVsjLXhiQbD2JB4n1MCRX95p6ci5AaHmU55hjAR08dkiWx6ivZB07olx/+769
	vXXSP99eBZ/8w7XnhbAsNBIJbbWqQJEG2ZknY4gwvFKS/GOf1wp0teflyYaB6JMOGJhDIomdiLS
	CKq6H2dgugfOvP5AQxhssap3bz7F2jQH/FV1VLuxRkyJPnXYJlNTKe2/7FZ/MtWqsSLydYE1vHt
	HjpQKE/VtmN7tHTQ0/hh7xvBePJWXPDnIroB2n8HVQTS3z5c0etQEcd5VqDJ+tpC9+yW5t/uiIt
	HbIjljOZax3iE2EYfyb0ebWmvxWimrNhg8XSw=
X-Received: by 2002:a05:620a:d88:b0:8c7:d2b:b5c9 with SMTP id af79cd13be357-8cd5aec945cmr11420785a.9.1772578806299;
        Tue, 03 Mar 2026 15:00:06 -0800 (PST)
X-Received: by 2002:a05:620a:d88:b0:8c7:d2b:b5c9 with SMTP id af79cd13be357-8cd5aec945cmr11415585a.9.1772578805852;
        Tue, 03 Mar 2026 15:00:05 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f2f62a18sm35018471fa.15.2026.03.03.15.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 15:00:05 -0800 (PST)
Date: Wed, 4 Mar 2026 01:00:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: Add support for MM clock
 controllers for Glymur
Message-ID: <2heg7nzyu352sozxuufoz36o44mnnsj5uilbxmxu7j3izptywc@hwkdnrqciybq>
References: <20260303-glymur_mmcc_dt_config_v2-v2-0-da9ded08c26f@oss.qualcomm.com>
 <20260303-glymur_mmcc_dt_config_v2-v2-1-da9ded08c26f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303-glymur_mmcc_dt_config_v2-v2-1-da9ded08c26f@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDE5MCBTYWx0ZWRfX7DgLHoB09FLf
 I/r50cLmyuQYsv5h04mSsh11t0Y+ziWSxuv37tPahT/D+WUdz7D+U9XnKEdaFI2+jiraQsfm4Xc
 ICO0sPSsBQKd2UOeTos6p//DRRRx5UEo+4jnJ737q5X7sS5hkNFbUrthfk9hYXNS8feYe6/j8G9
 j6JU2BqKBw3fH4nCSMk9fK0ON0q/zqOF4lfuTzB8w51FdQVFb0DaQS6eUHnqUc4PNNbHGjhTPT8
 /7y/dzYhYWEhsKu0ygpELFKQr98P/MXmm0zT49a6iZlk4bsISdpyLfyo/19EY0ZBOyF5hg4LLbF
 eGP0nWRN8mhq/0lkUj1HQyPhX6r0JXPydlfUacti+EhElG8MmFAEdSsme/oOjecDSrvV9g51dsp
 vJXBGIaCvzTVealHrBMNjgreozfkxqaNSxHlTHlbLi5Yxk9Y+f3Oyj9I1TbGboszeL0AEdoO79s
 jAJlrEgjt5UrnKGNahQ==
X-Proofpoint-ORIG-GUID: 8syrdIjy-UvlS9SQ6DLB6EvfmpWUDb31
X-Proofpoint-GUID: 8syrdIjy-UvlS9SQ6DLB6EvfmpWUDb31
X-Authority-Analysis: v=2.4 cv=EefFgfmC c=1 sm=1 tr=0 ts=69a767f6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=i8W7o3omJKFOiQ2jl0IA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-03_03,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030190
X-Rspamd-Queue-Id: 2E3531F83C1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95221-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 11:22:51PM +0530, Taniya Das wrote:
> Add the device nodes for the multimedia clock controllers videocc, gpucc
> and gxclkctl.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 42 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

