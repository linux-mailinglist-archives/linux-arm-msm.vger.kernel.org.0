Return-Path: <linux-arm-msm+bounces-118008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aFJwKtGmT2oKlwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 15:49:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BA728731C21
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 15:49:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Ub/rqc/T";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CUFeOqoN;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118008-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118008-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4EF2730B4EE8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 13:34:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB37827FD6D;
	Thu,  9 Jul 2026 13:34:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4A22727E2
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 13:34:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783604076; cv=none; b=Nqtfg6m4m0oVtZOzfIJ/GATEB7AQ9nqAWyAG7bwIkkD9kPB5nh6744jX1/+vgVMLvnNpaK5qibl20V+J5H22XAnthrrRgBH4bDDj7Urh6fUUvUER7zmdXfAq88SSwRjTkNAwRAMEwJsIH+x82F2ym8qvbl2gmO/5cr1KGwTTLns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783604076; c=relaxed/simple;
	bh=K2T2G7YZiWLfbnn1GVJWqxESyobPigjjzduEmuvYRuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hASHrPytEbf5aIz39c5RsV2iD26lc0E2yDNV9QmhUqJ9pDx9ImnhXw926aqo/j60QHx2Zlct8zBL9q+441Jod+YBc6xOne1Qr/fPWDLhIgt18VC434aLvskDKaqX6m43Us/MW33MVwinzL9wGUR9Q8sD7Xv6fjuADDVvVs8JnEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ub/rqc/T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CUFeOqoN; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNC8R1575382
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 13:34:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SCzvZFEyLv6RgTnPfwDuyZla
	L1syzlkWX0WSeE/ZzO8=; b=Ub/rqc/TpnhHS/3VzsYwNHCR0m8a6MZnx3IGIthQ
	GFFTY2dSz1D3gIaGk8NctA6Epy0KHoKfwUP/DQIFudc22XaojktBwVLM+d5i79Q+
	6N8rtGZCene/OmtfHgiYdEgJwTuiCIO7jfAKuNt3v39xS/xUW6qqSW4rwfZ0p3aQ
	C/PLMmTtVi6LSnFhS/6YmIMLtub1AVWO5qds6KdtVps/AkY0q/RmanOXFc9KH2K4
	WgAk0A6Y9YqjvALbGrcYo5VQnFFRLtzFDxlQbByQaRufd6Uqt8C3ZhDcthdGxJHu
	jNbzrZBmK71Godet8KyLsfZXz6HSst4iz/1ZSgrWQNkUlg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqwcesq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 13:34:34 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-744e7c36621so472973137.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 06:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783604074; x=1784208874; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SCzvZFEyLv6RgTnPfwDuyZlaL1syzlkWX0WSeE/ZzO8=;
        b=CUFeOqoNrV5pPcIEr7oQhT3Et7vQnD1VEx8jl0mDxdXiYhIJrpGkXl4sQTzT/OGAbS
         +Af1kXAMXIU1kDN9yGvvEZq0UwNipYseKOLwpWmqFiy+mBGab1DVZwF1kTC0hvWfQEOy
         gEnThR/cYQOkM28ea/Yu+o2JTjrsU/faTZV75wVYwh8rSueZpnR36bERR1vNJLXwwerp
         9Pg7XwbZXXUzk6shEhK0gtwHqu/buaMOO0ljOiMvYlPlFvHomOzdSRb39mtTQBRNTwq+
         Qr1tS7fiZwzwhXXGMaBqdLw+qQHwZPfH4aCUfwsZR4TYEXyo6H9tBr5bnjiwuAqBrDXw
         /xEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783604074; x=1784208874;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SCzvZFEyLv6RgTnPfwDuyZlaL1syzlkWX0WSeE/ZzO8=;
        b=iknFtqOYUgqAKfbZYA8Hd9UJlm7JdC+yp1w4HMUfqLQNmsHCxmlDRB3RTmaes1s/X7
         epWIIkziyuY6MX9TYMEN+/MMokpIrNyvu+tOn+a7oU/ykh5Px6AkMjIlEFt7Bu7yKoJn
         HajHsyQpP8hZV9EPrLjiKfzybDmqggFQkbqg4rGpRzKSXPYwI1cdZWQId1iZvHcbC5jf
         is9seEJDA3dG2zWgJYbs8XMZ3te5lu96ox0MTkX1cpCtkSnkDMpb2VpcdX1UiG5IYmXS
         1bc+ywhTy4pjF+Tly/imWSA7FEVAr0KzwrBIKGO2pMOLTvH+xdqfFiCtBGOT2FnfqrtA
         dLpQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr4cZNWs0EvPYKKR++BmJZxbrY/erZsijIhZtRHMvACM5sW+GmGfYWpMxpLI6ggQPsi21P9VDE1FrLszc5B@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl0zK9aT/A3hx0C6VG5VKP+dowGHjm1w9sajzCPYbhOd8zWlVP
	8F6dm66QmTVDPfryQgq/olUYodJT79tf0Gi/LZq2Ew3W+g/orAo4JIqq9UoJ47gJNTTTBqQJeIy
	q2GShJgPr5WhER4eYTy94tFp/nmoSqB2lxhwqvPinYqIvoqPaIfXUm2cwN+Mx5U6zQKcd
X-Gm-Gg: AfdE7cmUAfQOx0vsxy/Byzzl8SusDdc8qgZNDk6CpWjUZhhjw68371fycYGYTDXSJpk
	4Ub7FcoXu73JU5eqHTvN2gfiQl0G6EUrar6o0EBDUaP8fjgyhD+Y89CwosQYD+q/M8nLH+Q0o3w
	dalqkV+ANkNgMMYF9cmBaNPwX/Pf7E/mrRXNFtGR2q6T8qE9Ca5+Q2DvExd8B4YrzZ/kZ/ZFBIF
	Ue3d0gJAUSW51CwB3DoKBZCPfVUA+fAEeQxDp4P3xhToqCMnzlkzm5v9ZfNldJXBQDQFEzYJ8Y9
	ekyQncFYFRzpRH5hN93hPYeUx5sFLu9iYCcZnVd6lQCVE7ezD7yp8xbgVRW5d8q9MNeIIU/MCzf
	y3w67TjWbOR+k1eySfB81DxBDER4+8sYxILRSRNMkSixUyadE1uTFd7Qwzdi6dITKAZSbH5UVx/
	hgo8DDlSD4iL76uI6a+NqkxZ/a
X-Received: by 2002:a05:6102:2923:b0:738:9c79:7513 with SMTP id ada2fe7eead31-744dffa3fa8mr3830154137.7.1783604073357;
        Thu, 09 Jul 2026 06:34:33 -0700 (PDT)
X-Received: by 2002:a05:6102:2923:b0:738:9c79:7513 with SMTP id ada2fe7eead31-744dffa3fa8mr3830131137.7.1783604072873;
        Thu, 09 Jul 2026 06:34:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c84ba1b9dsm3373301fa.35.2026.07.09.06.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:34:31 -0700 (PDT)
Date: Thu, 9 Jul 2026 16:34:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: kaanapali-mtp: Add SoCCP node
Message-ID: <smmir3sbtpaqbmaddmkrb4yusjtuthaafmgzckmwqrwrjnrw5x@pnd5al6xdrdk>
References: <20260709-knp-soccp-dt-v2-0-6e2bfca96088@oss.qualcomm.com>
 <20260709-knp-soccp-dt-v2-3-6e2bfca96088@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709-knp-soccp-dt-v2-3-6e2bfca96088@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzMyBTYWx0ZWRfXzOTJRCxXV1J0
 uBeddGeZjAEu44Z/cHw2QMCn5p1IzbHkDJybUk9y+WcZpXs294QkURklGRr25YuCd8yD94gZfSE
 qIEMU0LUaP/1yst61GZvVvPOLu15O8S/ic01n1pLSJcRsCwQpXPEVqFYD4lcVeEri9j0KGUn/id
 h5sJxI+2GU8vy4NVTJizu3jaFv95gciISnr0jQOo4SjatIvJkSH0p2rXTDXIBaZbwFmbtpsJkcb
 3XlGx97tyZ5zu5Ta4yntICD7rAvdD5WInqchBpGElv+ST0WbHMs9PJiuc4zEvDs63JLd7A4DfSF
 whZLryxDeyXSikxQP+8amxpq9CgMNaNW+5f//3YTBAKKiKkGTjX0B409k7BQ7Tt5kQ0mf0u5puL
 WoLyx769ET3NSEJ2KeTVsGe6r+q0JUP/AT/722b7HLk7rxqehWympq7G7q0ko8RCMsu3fgnuJyx
 Fxi0M3Xwv2J8s9dkcIQ==
X-Proofpoint-GUID: 74MKswLRCHLjXJt4frLc7G05XMbtHg_Q
X-Authority-Analysis: v=2.4 cv=fMIJG5ae c=1 sm=1 tr=0 ts=6a4fa36a cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=xI9PflpFdleAlTMqXZ0A:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: 74MKswLRCHLjXJt4frLc7G05XMbtHg_Q
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzMyBTYWx0ZWRfX/zIrGXfrrqij
 V+LQjuzERia4ydEug4FEYwx3BpZ6FBxlVBCbPmcuXVX+8KrNIIBmgEi0t+MonyH7Zy16J/qCfGJ
 +M7qj0LYnnJaX2SO5CYepT5UJpLc6f8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090133
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118008-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,pnd5al6xdrdk:mid];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:jingyi.wang@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:aiqun.yu@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:yijie.yang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BA728731C21

On Thu, Jul 09, 2026 at 01:14:25AM -0700, Jingyi Wang wrote:
> Add SoCCP node on Kaanapali MTP board.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

