Return-Path: <linux-arm-msm+bounces-93861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DqdJEkTnWkGMwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 03:56:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D591812D0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 03:56:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7CBF73105F14
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 02:54:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD4DD2248A0;
	Tue, 24 Feb 2026 02:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z3/hFRxh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A/IvyJk/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE6C26B756
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 02:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771901647; cv=none; b=rKq/5y0IBbUUm9ASIDXi623R50B8Ne9adKfIs0SS/Ujr5LpYClFTZMuFG4MBexnApv9mo2SP+qwwpGHq1Q0QpmObHr8EVEUadzM2NDe5sCZfKZ3p3+TLCK6C5y9cU8XqfoBHqUX1QFlD5cJ6vkKOrHx/7F4d4eSvrXCwek55OgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771901647; c=relaxed/simple;
	bh=XYxvyMaL8GZCCMMU/D9Mtr8NAMRYSnNNjE8hwYBHyV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gkGwJFm0nsrlAwCMCGtNQLxsR7KN0Mb+QBP/SsmZZmH/74up/p7niVm/CCYLSQJPFIlLe5mjuslBG94W7PEjI4kr1AW7b7FBAIYmNRI82hxVEqmjYARKDxRgWFjhNVmAr0/Fakdq2XMNCpUTKdAahCCvLQPJTfvKZ5BTvi7vHIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z3/hFRxh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A/IvyJk/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O2mQrO2613584
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 02:54:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eDZvLuw9oPwNUlQYme33k2yd
	yibhcg2uAfYhuda/TJ4=; b=Z3/hFRxhF9+CFRWkIPyiGFBBwVB5gShDvb8a+u6i
	0piBpSzaqFGP29/xAAL+Api2sYNPlqSLt8fOmYNjDSu62u7WJfajqJdcHa8TxHFV
	kvJW+m6cFVYSM+2ASrcEMZxsnT450KwSrjcfAK6lHZJ7aCqsN8gGKT1K7Z6Hqy7x
	sql+82c5/n12GusgSyYLB4vWSrqyowWuShYg1LLdnqCmQuLAoq5wOdUBUjCZGqJb
	Cxd6cf3i/Ye2NB0+TCXwwYSyg5AFRrcVHJscAceVO2A1Z4M/QR14VMrgAzsfVRc9
	lkSmWETbwqe/hQjYSaZiQOUw8dImVHJsh9mNyaF8qOl61w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8ran2q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 02:54:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb4817f3c8so4078380985a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 18:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771901645; x=1772506445; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eDZvLuw9oPwNUlQYme33k2ydyibhcg2uAfYhuda/TJ4=;
        b=A/IvyJk/WgjhhqvfwWS/76hL85o+Fj9rKNqysmreCji4TjC+oZR5Y2+PwUrrKdzviS
         AJfFF4TfVxVfPb2jfvx+ROb+RQ0paxREOtHffl5rTz5opC0s3d4LjypNvUbC6h26k9J0
         JJ1TVG5nDbeHg0ghV3zBTRd4YPLTAsJBncgNd481Hk4j7mqhXEoH1JvgVKEtHVxcqIfS
         culjyQ+NPV+ChEtnuvGQGNg099syATBMHEIo4yhMxKVic6IOTuOjeuu08Mxr7lH8qSSb
         7rjAOOPiespWo7ryWmDvkY6IH0Ffu5aYaeYYon0fOlst+wqcK6QjCFPSMcYDN9bsAZsT
         YDpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771901645; x=1772506445;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eDZvLuw9oPwNUlQYme33k2ydyibhcg2uAfYhuda/TJ4=;
        b=dR+fpjP7y15/eZwpq041IyObymgdBBuLikumOCttx9G5G5VFshrl9nZtA6XLDMghT9
         VcBkQiuBVsSyh28I8Yk86AZGfo3rUpv8tVvlSPhAS2k6a2xnizE++WnFOx4hrY6h9sLR
         qqpdhVOUAxCWtb8A9e3JvIGsCqetgDtXSPsdUibTpSr3SmN1sMbTGKFQhe8r2C76IMEt
         2zWTYsHhR6SpFN3nwcBQZ0ViMO5LJlAuTt+5WIkiYPu3oCROpllqycIII9GSTdCLD/lr
         1oGBSq/TLLW/nUfgp0mxcmGxNTmCczE0QrhIp5gVRHaFM2JPDPgZywMo742Egrbt5/Dh
         L42g==
X-Forwarded-Encrypted: i=1; AJvYcCVHbhtfi1Df59TJdylGkBNtkWoaRZmy+W1nIe8Oh7LOF5iXuHKkY8y1c8SgsdIUSO9Zvl7uGsr4W8vGNk76@vger.kernel.org
X-Gm-Message-State: AOJu0YxqqzWYGpWRcrwmvZArPHB8v1KhgsYpUZgeouhjrEWgwLURnN4e
	NV87FU+p8W4V1DRE/gKTuYl9Mo517VY6zVgugAYpNxBLvczFvL3Aw/c6q8NC4n4R7Fl7bXe58CQ
	xmqsSvhSBJjCIbGUD0JuxizHBsDE56bVeqwXYOREbvD56XVhu59ZRZwQ1RGWyPx3+171c
X-Gm-Gg: AZuq6aIZOiueVSsm9G29hbE/qDdyGGBTgDJ85k/HC11cb9qWQFIDK4Dyvrl7vs10eyt
	K+wr4JnOAxHbEDPLnJlnl1aZ1zUPh4Elm7zqSsoQc83WlX0jDDkSMuSKR1O3gzUSg1PWi2meA7y
	IONA73j/qoj3id+WbnHeBNPf8pJJGLUvEHXvN+ty3/2YSCgSD42KrYzv4CrnUAXeb3uX+fDIToR
	qIQkr/AXfZFAiL+5PiM8+nztmaqsAxn00h+mdptn2DASFuXHbBnVE6q5gqBjh+8nr7RnwOVurRN
	LSjOVjrUsFVTQtw+Wic1enHyK7GRtF8wfDGCg1j3D66s/xzSNIMo3PnfKiDW1+R3W5Lkaffiyfm
	0mUgApcQFbkVNUFICdPpbSbJvVTUFSsFlWFG1j5ueY/xIFZyUANeP36YTmJ9Eup/uNTl6/aDM8f
	8ZKvhWEPIk+JSk1PoN04UuCJY0wvEJUrb8YkQ=
X-Received: by 2002:a05:620a:19a5:b0:8cb:5393:20f8 with SMTP id af79cd13be357-8cb8c9cdb1fmr1299569885a.2.1771901644894;
        Mon, 23 Feb 2026 18:54:04 -0800 (PST)
X-Received: by 2002:a05:620a:19a5:b0:8cb:5393:20f8 with SMTP id af79cd13be357-8cb8c9cdb1fmr1299568285a.2.1771901644490;
        Mon, 23 Feb 2026 18:54:04 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389a7878d3dsm19737511fa.3.2026.02.23.18.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 18:54:02 -0800 (PST)
Date: Tue, 24 Feb 2026 04:53:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: qcom: qrb5165-rb5: Drop redundant
 non-controllable supplies
Message-ID: <n6u2zoyfqwhptsxmnhg5jarb5xeqlqfoktqkza5ctidkecmydu@3mil4chprvnt>
References: <20260223-qcom-dts-supplies-v1-0-f90ac885b3fd@oss.qualcomm.com>
 <20260223-qcom-dts-supplies-v1-5-f90ac885b3fd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223-qcom-dts-supplies-v1-5-f90ac885b3fd@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: SgFWcQaCHdirCr0uKQbCvYIcLDZJH0o6
X-Authority-Analysis: v=2.4 cv=V7twEOni c=1 sm=1 tr=0 ts=699d12cd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=YQIQ00YL77e8QyTPvtEA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDAyNCBTYWx0ZWRfXzFKGkyCR/CtD
 MeQ/qrs5P7UyO/5s0kug/s7q6I3y/37ZeYbX3UFyoyWO8Y6xJutVcNERk3JuLfyO1QfCyePw0ek
 tv10FxbKqG00Y7+4SsKkxbXRPvCUMyxv9kxqU5p8Nz2xw/YOsocpD/C8aAFjmoc2dmz5p624b51
 R4CS1aAvxZi28uP/OnepeDzqFMLycaCTgFFv+cI11oyG4yP9jRCD/EAdCtLttOmYjdARYT5x37m
 uwbumcP32Vpk+DidLqb8Bt2WXJpFaApmIhihPaVfe1iRNDNf8buupNCL1WixYTpEsPGvhyaQj9n
 cdm7xzx0bzR4wY0PGfbB+sYXeCL80hm6AjZ6qkbToQNc3qp5W/7qD8xbvMMULU3AH883qpphRoU
 Jsm40c8HbDZEqYfF8nuRmI3w+ZXvjdySEkFjEBOEsJYYs40ONyGjnBdjObUqNLu5XdkQA++fgUh
 EiiQT/101hpzx7vvD4Q==
X-Proofpoint-GUID: SgFWcQaCHdirCr0uKQbCvYIcLDZJH0o6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240024
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93861-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E5D591812D0
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 03:54:21PM +0100, Krzysztof Kozlowski wrote:
> Drop completely redundant non-controllable chain of "regulator-fixed"
> supplies, which serve no purpose except growing DTS and kernel boot
> time.  They represent no added value and because of being completely
> transparent for any users of DTS (except the bloat), they should not be
> represented in DTS, just like we do not represent every transistor
> there.
> 
> For the few regulators being actively used and supplied by removed
> dummies, change the supply to match the actual final source without
> these dummy intermediaries.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 39 ++------------------------------
>  1 file changed, 2 insertions(+), 37 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

