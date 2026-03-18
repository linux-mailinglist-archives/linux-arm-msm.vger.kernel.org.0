Return-Path: <linux-arm-msm+bounces-98506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cElLAEy1umlWawIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 15:23:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3882BCFF8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 15:23:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 56941300C983
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 14:23:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D4CE3CF697;
	Wed, 18 Mar 2026 14:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Oz5FWSa7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A7qWYfYb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EB7363C59
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 14:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773843785; cv=none; b=bCrjo8qC+zxHdwPEvBZH1JSHXngNmlm0S+vkjKIadnI7UE1vDRdfi2o9cgJyeGEVD7gSJnXW0bKJHK+LSu3aD5hN1utth7QniYJPgmu+EN5y3ppHy1APyuv1AQ7shLx+mlGcfdiqA/Tnr/o2nInVyJTVF7KIW2Vxs9YQcA7o9Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773843785; c=relaxed/simple;
	bh=Q9weczQZNlq4V5LU7OFVxYCI1f0RkQbRCeW5JMCQIVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gh/b/AWBQY7U+vRpKfNxPzGZ7vvqE+89LC8QOGnph01she8abG0zoQnUxfAOp6l2DBJSBZ52G/D+IoEkjigsNi9qUieQK+xn3jxT1n5hQ7O8TinQzneHmp+4HT2qvpWHA2W9qqtcasAeYozwfzDg6wz6NxV1zvjHzaGTeK2WpF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Oz5FWSa7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A7qWYfYb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IBhFIv2878157
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 14:23:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aW9Ly+vg2C2IZtTjz6Kodufc
	Cclul6x4FKDK7StJgVY=; b=Oz5FWSa7tk+soLX8OIbBMIm92GrOLaUoaFP1WQ8W
	km1cMa8/YEpHKqmy6+a356YV82oGvQ/PNumYdr3vu02mg7Ldb1sbbkJt5VDpKvKm
	JbvARFk8txfHuZGCE4KgA5fWfysrT1FDTSM/chyzHMsf1l14vmUtbsPk7nkFuq+k
	UDq1Bvca42YF1IMbXGI9OA0QXELa76t1cShk/J6+BL4Ywp7GRgBVlxPGicDmihdw
	aoXATdGHmuhVoMJlUdjqGOSHCadtylOV5rHmkE8FpeP8ecbuziuVWY2wSjgX1tyK
	bQCwRGARn3PpP2X93qq+Gs0UJQ+59I7NhLVw2f5C8aA7uA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cypwr1uk9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 14:23:03 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5092efe29dcso61825741cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 07:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773843783; x=1774448583; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aW9Ly+vg2C2IZtTjz6KodufcCclul6x4FKDK7StJgVY=;
        b=A7qWYfYbq0m5TQMp/npYMwwRuNw+oOF/7H663/u9DVfF4ffkPjzOqHx2WIZjDIHcNd
         l1yGac02aekSLkZAsyrf1mFQlQ4vEqABjZCiOzq1yY04WelzPq0lcbz4v6csgLk7nULA
         DWqhhTZvlvhxYw6i1s1C0KZd3/T6Z3TdRS22+KpdVfMKhTPXhxYcNb2nCTIt7EmLoybn
         rkIcVKYfksIE4DnCy1Pa0tHeicS3Frn4llpLhY3cESZ8XpcAsJDo8T9E5dVGOnqRxE4L
         PFTbLbKdibd9a9r3XzETVnm7dl+CvFqu39fpR7MspDEoYCHUQJNBbAInpsShAxcOuBV1
         YdvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773843783; x=1774448583;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aW9Ly+vg2C2IZtTjz6KodufcCclul6x4FKDK7StJgVY=;
        b=Ko0rHrBkqO6EVxp36HHqeGbz6rfQU3WtBDxDFhR6mFMnU9xzjnRyOTw88REFSL2t2W
         fxGCb/1Rmh0LsLmNYUwjlaj6OtbHdbuw1v2Sz0vGT6iP6kXCOcfwe+zwgmqCyK8GuzBa
         KkoDjQfLpD256lxaWOs1JpMgvXnDdgxpdxD/IFsr4N+/dy01ywUl282M4ih5Wn0YbNWD
         Z8XhPsG/+h98bx8Ob/tAEuvmWikz8VQXr2+AMe/ZXoX2pxJZvyhEoeVBO++T17M1czdG
         lbayrrh9n3hUAh2aiBz5tvsWauvSpWSa11Bj64eLBtqtaDN+HTV+BS2TKbeQd/J1TUxJ
         FEpw==
X-Forwarded-Encrypted: i=1; AJvYcCU8ICWDlnCLpoN079VhV6X0Qy/Z8O1w5ckAW0n3X3+8cbQqlA/cRy6XRFAhCLxJbUO0SD1CC5uc0C3Hn7Y9@vger.kernel.org
X-Gm-Message-State: AOJu0YyTz09uqhXN0wl2ugEogftG4YK0eQIyi51upVWHylX5QET/8ETc
	Fze5LW0bV3tCqR8Mdi37XYryAJ45YUSNzGX7g2wWcrttK67NwjVpK9Z9Zt2nF1XKTWnMw1DXjQd
	z0NI52CoucyQW/BJKW5QzLcIsQmpVWm2kOQfD3vAG4xn4EqnKAX/+LmTIdSUMFxTMePTy
X-Gm-Gg: ATEYQzyH3eFiOOg6tA4TUeHLgu+sPoTd0TCamwE1FwsmxWloUTPLDRXNyYP2nFnVkQK
	yawY9YWfD99L2l/pF0ylB659yNyr4boFlcLJ/yc0Xrw1ol//7s/YbZWqHrP/m6LAcSxlHjMOWmY
	VjY3tTj9DWsaImYa44o3eRL/vG75QD76HaxphbUMBdAes5Xdko4+zROSXS55218P9IR5/y1SD/w
	U5yQDf/J9xA/1GlUlOI33dhnOopIOmcn2TCwV4TeXPXD87hA1w4qzAQlAh5NYmkUXBaHoOg2Wj3
	JrzseBzoHJIUqVJHjG0++Y+EO7qU922Hv64lZSAwBjL1tCERDYnshNl/uNQX/XhYPf/VHIHzwNH
	L9AdVwHPWZ0Snmwt4oHloL8YBoKlqY3dVjw==
X-Received: by 2002:a05:622a:178c:b0:509:2677:6906 with SMTP id d75a77b69052e-50b14806f42mr42820651cf.2.1773843782647;
        Wed, 18 Mar 2026 07:23:02 -0700 (PDT)
X-Received: by 2002:a05:622a:178c:b0:509:2677:6906 with SMTP id d75a77b69052e-50b14806f42mr42819931cf.2.1773843782002;
        Wed, 18 Mar 2026 07:23:02 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b518a3e3csm7666456f8f.35.2026.03.18.07.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 07:23:00 -0700 (PDT)
Date: Wed, 18 Mar 2026 16:22:59 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: hamoa: Fix OPP tables for all
 DisplayPort controllers
Message-ID: <sotoyaogawzdlazsbuubwdj7cuoolortj2lzxgs2reew76gkpj@vyts66j4hg2l>
References: <20260309-hamoa-fix-dp3-opp-table-v1-1-1a8141d71f9f@oss.qualcomm.com>
 <taqh3ipe54cgjwcvyqnysg7dx56mweo7zld3jvmv6goq2vo4b4@ea7ksdyyn3dh>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <taqh3ipe54cgjwcvyqnysg7dx56mweo7zld3jvmv6goq2vo4b4@ea7ksdyyn3dh>
X-Authority-Analysis: v=2.4 cv=bIcb4f+Z c=1 sm=1 tr=0 ts=69bab547 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=eLAmAJk3zG5eISbtyZsA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: -MtnXgTYE_2cW_e7rpo37BZcvbFfo1gA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDEyMiBTYWx0ZWRfX3KJN33DQIXLQ
 dRgZow5LhOJcCU8HWzjUTvNGvCzPQBdOCua48NYAdlSu8I7n1vaGxbXo3Kdtrbmi3Beba1BUd73
 8zCc6Qt/1Og4u4vbvgI88EmtX+h8p6yAYQFsie8DvXGWxfS6k71YvDCazSunJE6+MSMQ1aZ7KvV
 h1oXQgAoyrptMPz7FVlUyhXNYpNpDuxL67tuZr9MfTZoYbRZdeo2tAigax4FaA+M9kQZhnqVKVq
 3dbOgxMj3kS3/L7JDTqfJ+5a0NfT+nK4+uYlHdn94nUnWhaXY1winRNYfRDp7ojBZe24xdQIDGB
 peq87zHiDdUAr10fgiOzq+aQFGomDsRHHzBicj/zYGAQtzRBZcBt91MFKZoMw2SpGAgSw3uLLTG
 nAJObPL220VkS/VpMcMjIvEGKKiqYve7CGdOvAdLOap4Opxdm5kc85qqtJP3KH7gA1GtxUgQyIG
 6FXiwraZBZ3Q0NyuP2w==
X-Proofpoint-GUID: -MtnXgTYE_2cW_e7rpo37BZcvbFfo1gA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180122
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98506-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6D3882BCFF8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-03-09 21:52:01, Dmitry Baryshkov wrote:
> On Mon, Mar 09, 2026 at 04:44:45PM +0200, Abel Vesa wrote:
> > According to internal documentation, the corners specific for each rate
> > from the DP link clock are:
> >  - LOWSVS_D1 -> 19.2 MHz
> >  - LOWSVS    -> 270 MHz
> >  - SVS       -> 540 MHz (594 MHz in case of DP3)
> >  - SVS_L1    -> 594 MHz
> >  - NOM       -> 810 MHz
> >  - NOM_L1    -> 810 MHz
> >  - TURBO     -> 810 MHz
> > 
> > So fix all tables for each of the four controllers according to the
> > documentation.
> > 
> > The 19.2 @ LOWSVS_D1 isn't needed as the controller will select 162 MHz
> > for RBR, which falls under the 270 MHz and it will vote for that LOWSVS
> > in that case.
> 
> The list of issues isn't limited to Hamoa. As we started to look at it,
> could you please also fix Lemans (drop 160, 270, use 594 instead of
> 540, use single OPP table), Monaco (the same), SAR2130P (leave just 270
> and 810), sc7180 (270 at low_svs, drop 160), etc.

For now, I'll just do Hamoa as this is the only one out of the ones you
mentioned here for which I have access to documentation (yet).

I have prepared patches for all the other ones, but I need to double
check the documentation, after I get access.

