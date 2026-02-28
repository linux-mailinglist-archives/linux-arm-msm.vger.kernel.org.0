Return-Path: <linux-arm-msm+bounces-94614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCpWIaX7oml28gQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 15:28:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2685A1C3963
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 15:28:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 457903063B6D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 14:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BBAC3644D2;
	Sat, 28 Feb 2026 14:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TYnd5z2T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NIEiuNKT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5033D2D47EF
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 14:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772288916; cv=none; b=Cfp/59tF1KzQFD7WfyDHlO8SVShsZ1PxAzs09ImZOymZpPkTw8NvwRjsB0Uz9UiUa4C/eST2OeoZe3rvw1dOUUa/EIkaXCwhbDVd6ba0QNl4xP0xa8dnvZlRcJW3njongpp/5p98JjcQtmzL+lpLPp4FF+gv0JF4fC0mVqGgNok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772288916; c=relaxed/simple;
	bh=eiU3HBmXNG1YkKA+akB2XnYh/0WDhZmk3Cuhy8omFio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oGSAr3EBQHPoMYla5FamyFOp7OyIizvdcLgHdYWwURb7ribm62ukgRjEQt6TqwU8KfSDbYqmn+akXuGyd8IESsOwN2+Bishj18fRtSd2+OQ1gKP/Sk6nqwcfZbm7febYRc4011dHIJYZlF9QLPwwzueCIj3Tn4yAzwjIXNdFh/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TYnd5z2T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NIEiuNKT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61SEPRI53968512
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 14:28:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UtIEEx7IZ6KH8YRRxMiZGyHC
	dpv2NzwcnMso4YuYxKE=; b=TYnd5z2THhCb5lZj1xRTbIIB7raSmA8kDle3jvyQ
	/01GYepsD8lMgs6VBCnZemA/gT0VEdBa5RUQyGWiVTiCKxqR4YajeFYvBUdEKs1H
	jkCX/kleQMSLU5mPRvG7C9o7iFg6h5X87B48nlO3p6Zrzwz1AuS4q+j+3O0DsI6z
	hdtZe/cEw30+t1X0IN5Nvw9OaLZDzlgmB7fxWjIEHDVnVxeZgHrphk7BxUeqR4oW
	MViiCCt0l6PxTgEH9RrNwqbbyz21byVyBLyCgbEnsW/qTcmLhB7ALokEJNebLIwG
	1vdkycwzgb0D08RHQvUGoNOjGr3UcsoIvWc/vzlcVn9ZMw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksfyrxyg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 14:28:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70e610242so2604198685a.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 06:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772288913; x=1772893713; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UtIEEx7IZ6KH8YRRxMiZGyHCdpv2NzwcnMso4YuYxKE=;
        b=NIEiuNKTbcVZF3Fl/CVWcA6L9ShILJSMnok4vYWs2aEOiBKG5ao8KeBPcNHBHZDaeq
         9oggMC7DuGQPZlJcraYxJ/5xXEzpM15Hm0vEWbHKoHQqIvV78ajI6UG8/OU9oVfYCvd+
         /jQI3JLttNalL7ufT3hXcp76hEi78I0ODgu1CLBSZYNxrtVXy8iUxukUcku1zrm5S0G/
         zD58Glch8TBlDyr8Q2m9M9i0+phL52JrNtJWVcKTV/ehux+RAGmScqNFSDPXQSOmAwvx
         SQ7R6qVy93Bc6Th1Phqvls0LAktlz/MeUi+wsKCwaMAOHrYZ7H+Q0/UHQu30qm5Z5oM2
         BvFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772288913; x=1772893713;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UtIEEx7IZ6KH8YRRxMiZGyHCdpv2NzwcnMso4YuYxKE=;
        b=COig4ZWjvDt5uNc9dleEv61s9PIPfZq8CO/ZyocWbJPv6xsZk3LTjwfvPCTA7r/Zuh
         xHuvg9lqkA/NeYELfVCUJ0HzUr6mVu11B3lfpls3oBjCtlavXjak65yaVxe8VyMafp1D
         m0PLJh5+EB0zB4v1PCYrkaT+/+vsFUpdEsn8Yk78liK0RIrEWjlE1tCSXtfQrfQ0NhPv
         fr9sZ7JjJb5TLejP27gVvfEJCdRq6gT5eF6s3WBPptnvKYuKHa7Y0tlpB2MkvJqiec6i
         zsWNA7kF6WO9KmfjG3XpRuykdlEL5aRsr4uu2w9R9DZqkO4kp6srh6TV6lQx5rbtGRgx
         zH4g==
X-Forwarded-Encrypted: i=1; AJvYcCUOHObO0i7lKUjUTZc83FPud/C9P67ZwnJbuYs1N9RjhXzazsj20VB/Nu2ulIj/ec5/ZvtLLlmAPUswovkH@vger.kernel.org
X-Gm-Message-State: AOJu0YxsCmDgtviT7SdKtQYvN6yw5UejCxtpj86XAVY2zcwSvDrcABnk
	1J/NPZ4auLT8PFk73TaDmAEuyB5n+8MYNoUarWUURMMah/joopqDx87X6wAHq5vscCoxfl/+b0h
	jky5z9YQBBeCsVqnDE4XygU3dROOgJ+v/xrH7PBeDhlbUksOHq1RAfXvxhbG2KVOe+FaI
X-Gm-Gg: ATEYQzwLMRkIEE+xx57RLW2EabS0jBLkiG148B6i+P7Oz0JVh8jlQKU4e/VndrRjyj6
	z5Bos9va+LTNDhoLOuK9h0t4yMUr9q1TzRDo9sMROhrxbEkZLjbr50+bC1Tr0bl+tB7H3weol9u
	iDKuvPN6E+ciK+XHgnyxQ0L9AmniBKaapIjK64XXr1ToCjz6vxn0jCAdFnLkj1QglEJMZ/UpCnq
	ONbJl2QLw1crUCpfaSmDvMOviKdq27+0uQL/H6KzxBLp5uwCJvkcy/GxZP5ePq5abQuGafeFDj5
	pz329nUf9evjxB66gCBB/ViAhTyFLZoqVa3UUSp6Fz2/yOWeGMzoxaffJXtl6XlPD6wWilSwT6c
	UJtO0BfCIkO9XzkruArcruh2k0tzKPV/KNAzMCWPvPRC2+rSVQ/NRm4g5EjGSRxA5eoOW69ejZ0
	LK0PDgc2WJYEYZK6rmjMt+XgOICrgPO7LKxRo=
X-Received: by 2002:a05:620a:3191:b0:8c0:d344:47b5 with SMTP id af79cd13be357-8cbc8e525famr760922285a.77.1772288912592;
        Sat, 28 Feb 2026 06:28:32 -0800 (PST)
X-Received: by 2002:a05:620a:3191:b0:8c0:d344:47b5 with SMTP id af79cd13be357-8cbc8e525famr760918385a.77.1772288912154;
        Sat, 28 Feb 2026 06:28:32 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a115cae82dsm572059e87.5.2026.02.28.06.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 06:28:31 -0800 (PST)
Date: Sat, 28 Feb 2026 16:28:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tianyu Gao <gty0622@gmail.com>, White Lewis <liu224806@gmail.com>
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: sc8280xp: Add dsi nodes on
 SC8280XP
Message-ID: <u5ra6kbotpihuizs32iufz6jxh246tiqhzabtvjylksavekvyp@x5oa3vrggvxk>
References: <20260228141715.35307-1-mitltlatltl@gmail.com>
 <20260228141715.35307-5-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260228141715.35307-5-mitltlatltl@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDEzMiBTYWx0ZWRfX+O9jm6RNW3tT
 2JkDxyhBrRdeEVQFJAHzIYUl1CE32e35xIKxsn3HDOluNgga9wsAs4SXYBr4fYa2cy2VA5PeuoV
 Blqw1E5qcBBRpuNAsZcbCDPgJGQayidclhnxkujAgdWaU/Glybz1/ZfUhRe/EGOgeIhUFzIjSLc
 5AbR0toDY99Rtm9k4mv38ByfHp0KzMREo40aJ797hq33naQ2fyQ3xhvsIiypf+gMTrytS5mwR3r
 p584SaRg3MoqEsfPRM9FDB1Wz/edaAQuRWNHZ9RSuBF1U7GlRmXxzPfp00LMZ9b3JHipn2fJgDZ
 IUR8aHLZM1shvNxFGTYxlRa3BHhucygM9C9cWN2cFenljcCXPpINATafaCFEfF8s6s/Q874urhM
 C+KzrlMFP+sB8Uae9J1IVUcxjtA5jlPOoiyUKQ4aq/wFHfTAD7z1jzpyHAxIVTNtXETIjTcLNAP
 lFRjIUA0kMMUUX1/O5w==
X-Authority-Analysis: v=2.4 cv=avS/yCZV c=1 sm=1 tr=0 ts=69a2fb91 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=oZPMeiHd2FbyKtjdOA4A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: gMQqcc_Xpi6imAzXUtprQ1VQXcDCKaH7
X-Proofpoint-ORIG-GUID: gMQqcc_Xpi6imAzXUtprQ1VQXcDCKaH7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_04,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602280132
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94614-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com,marek.ca,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2685A1C3963
X-Rspamd-Action: no action

On Sat, Feb 28, 2026 at 10:17:15PM +0800, Pengyu Luo wrote:
> The DT configuration follows other Samsung 5nm-based Qualcomm SOCs,
> utilizing the same register layouts and clock structures.
> 
> However, DSI won't work properly for now until we submit dispcc fixes.
> And some DSC enabled panels require DPU timing calculation fixes too.
> (hdisplay / width timing round errors cause the fifo error)
> 
> Co-developed-by: Tianyu Gao <gty0622@gmail.com>
> Signed-off-by: Tianyu Gao <gty0622@gmail.com>
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> Tested-by: White Lewis <liu224806@gmail.com> # HUAWEI Gaokun3
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 404 ++++++++++++++++++++++++-
>  1 file changed, 396 insertions(+), 8 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

