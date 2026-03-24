Return-Path: <linux-arm-msm+bounces-99689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFLNDomWwmkbfQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 14:50:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CA9309B8F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 14:50:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E26DB300D9CA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 13:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB8183FE340;
	Tue, 24 Mar 2026 13:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f7lil+Lu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PhPdGb4t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE683FD148
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 13:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774359922; cv=none; b=aNVbPPAtLHSB9IVDAllag9JNmPog7nmpVNDIoVKRJ7GSDN8u17YVArBZRKL0ksqCPxncOV5pN/boN8La7xYVDJBwA7BSJYxUKZKEsi5keC4CcB5V2r7AQpiWmNRmHc++dm8ObSAMDwu9qAvDr4R16apMI8EQNLuIdGXUBX8w7h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774359922; c=relaxed/simple;
	bh=gMkO268GjxErRWLCU4OA2gNERKV4bWWnwoExRYieo4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jwNhd8+GHKoFZJciYf1nsvEMKlX0PaV4L9/08v9MqNBN6BKo0Dy9qik599l8du4+tISbOMCSn0jzgnISozrvmcgL7D+VuERQ3u60ghKDFvUbrh6lcSiz79TXCuySxIpBvL5hA+YgFY/A2JyUu1ZQfzV4JuDImlw7n3IHTx4nvEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f7lil+Lu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PhPdGb4t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O9wVjU3039718
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 13:45:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=X2razetQ/31YyAbP3U9Rogwd
	HzP3G4Gbg0GFFivJy9s=; b=f7lil+LuJsAkxbqkg1+rg8+GKabxKSoOewUVB3Ex
	CbosMfczSRWjoX7pH3J7U0mUgZTPEbbLiNsAIR7DmVbseHA9RvnrEu/GZ6aUS29r
	T9LtXtmgwn/xLv9+XbPrM0PkpH5TZrZqDhwFzOoZZ/QU4fXWdlzDo0y9CxbmEZnV
	RpQhKZp5ovnpqjQGSQLZ/X+spYTxrSJd4Qh4ND1YnyTdS3AyjWnFsneb0w8MGxLZ
	ezijnQDdVmHGHmRjP1mflGsAb2dGmH8w6jXYnzitHG5Jw7g+1+1MNtUfiUy2mn9f
	SGSHkDAmYdseP6q3gj58aFdo8CsbulQX0Ij1rRGrVI2g5Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3rf0gtr0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 13:45:20 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b274f94f8so377409481cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 06:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774359920; x=1774964720; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X2razetQ/31YyAbP3U9RogwdHzP3G4Gbg0GFFivJy9s=;
        b=PhPdGb4txFBprdX5rgo4o5RHrkg4BD9WIor4vrdu+kzW+lGtHv7KYYFuEj6wfGeB6a
         b6N52WOJTS68w+WkdTTjkUe+o6Z+7gS/FszIt6uz3wqv7Vn95g1H5GXYwnTWUHZ/a1vy
         gZERUns+33V9748zCUH8tLrDQB1iN1rL3ONV/t3rv/9HnO4m33CoVHCF5XXc9LgtyG86
         vYXCUMtFWH5sZa+BC1CST6zbkqfJpDb+Ghdrp4EOjAIVbZqwRXgpsZqHHZ/n1XFxEcKx
         Bt6ZFIdXKaBtreoWsRcvbE69rGXMq359fFEGqPVTScDjisizT/Z+sTdNhoGJYLaa4u8q
         IS5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774359920; x=1774964720;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X2razetQ/31YyAbP3U9RogwdHzP3G4Gbg0GFFivJy9s=;
        b=IT+cH1n7SU+MFYcYCiM4kPMJdM26ImuBjYn0rQiFFEAOPTBrQJqlfjPsKamz0RNiVE
         5hwRA9ynm0VQm3BAiLhbAUltUuPtaeplkax7Sb4r3lUIT59jl3SSuPzSadbSyXvwwwqo
         Z6htY0924oi7ulObnajnmNrL+pXvFALA021MigNGm/LrCknljlgpVsYwoBtbpWTMQ88X
         btYmd4ALz8WTniRurLb+aQ+9CGgrlCE7BuTZ6iim6cEqyQQjkBIaop/ANls6eQqIwZj7
         M57QLb7za1nzaHdOujK1LY1OdBmvEUzKPt6g0sCQN4FfyBAzttWaic2WwYSJQa81Z7/p
         kxdg==
X-Forwarded-Encrypted: i=1; AJvYcCU+pDdp9ulJsCmYI2Dq8QmuQEI1QAR3bNE0UskLoEtkm/QDc7g8N1Z8gU4BYIZ/sGyx+2IqN2W0BLb7jclm@vger.kernel.org
X-Gm-Message-State: AOJu0YyqDIisVL2bq1SmkebKD0Ht3CcGtCIvA8R2Z3+2Gl45eiHIdYO5
	whs3fRDPC+K6YeCFLwNW2w0wnUciRl8cWsDqbxHK/rG36VHZztsY7kYiqVtM9S4Wt/XTSOYUimy
	lxp5Jk1kcVRc4fcq7f0v2wCQgiNX13P2kcyR+8XTI3aSAjOECWyk0Q+zEhVvE/RfXsZqx
X-Gm-Gg: ATEYQzylD6ttIp9RgeC51EJMUETHgS0VIJo415cnwksnNoouszNw82XaSNKr2QOMz9C
	UlljIjuG84IFKgi7mS5Xbj7gRyNFEfw7XiWkaJjNFB886g2qdJ7gmIJlTz1HOlpZ8tqwZSjsJjE
	tG9Pam3olpqjL+uGHpt4n5MGgWbi9SQ3KMSP3AGev7R7/YB9KPYXYH6VeXQ4IAqgyY1ebBRr8Og
	qEZHnvBQARZyAJJiRnGZuXHYa9nfjot4/8/ygqk97o3pFeKTp9giTIL0BrX+R+YlFsdyZnchZP8
	FYz3Zrypgx+D8IWELZ5tKFjFkFLCfayXZsIY2OsBDdUCXnv28uPhxPgy8sWEx6HGu3jS5Q/po2+
	Dsy1Kr5Fg+gc/KFW2MyCJsqJw7BBFCUtRtA==
X-Received: by 2002:a05:622a:8349:b0:509:e46:84ea with SMTP id d75a77b69052e-50b6eecc75cmr37721371cf.34.1774359919785;
        Tue, 24 Mar 2026 06:45:19 -0700 (PDT)
X-Received: by 2002:a05:622a:8349:b0:509:e46:84ea with SMTP id d75a77b69052e-50b6eecc75cmr37720771cf.34.1774359919061;
        Tue, 24 Mar 2026 06:45:19 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6471a297sm37217953f8f.37.2026.03.24.06.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 06:45:17 -0700 (PDT)
Date: Tue, 24 Mar 2026 15:45:16 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: eliza: Add CX power domain to GCC
Message-ID: <qfaaehigddfg2mawxrat5fp25zu4ioo7ebc4pnojsrzwwx3kk2@4ke3phfbmk62>
References: <20260322-eliza-base-dt-fixes-v1-0-c633a6064a24@oss.qualcomm.com>
 <20260322-eliza-base-dt-fixes-v1-2-c633a6064a24@oss.qualcomm.com>
 <acHxosznN-xbWtjJ@baldur>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acHxosznN-xbWtjJ@baldur>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEwOSBTYWx0ZWRfX29+D/t4iD510
 kmXx8c7LIlKPR50Q48lNPiZy7ITC0+j2MSpvK7ywZK1UDF8g9KXwQwJvSfADyx3ZK4Bps7BJ+KC
 q3c1OEtQe0B+43jbl+Qf/nr3JIyQvDudW70MCn5VtqgvJ0jbtSkCTXiZC30E6iRIvSpBf3R3uYw
 dddLXyx9qWcXEeIm5f9KEx4cCBhawhUGY1aabQO1TSNc1cpqG42qeC46FcUO8PltlBD2LJlKXiI
 HFc8uY7B1ikdZN4NFiBMkjcrVS16PC8rmO5FkCVW/ptNrIqpxz7qCocp0zYH4f9Jy9xW2obgpmS
 JJxAoYdr58UvJzpzY2qIHjSzuT9wQDZver+mwu7mppFnekTjWPdnsyXikjhbFQI1xCWiBeB/nm8
 ATu7u8bHXZ1xxbtMNy9HIwbr8Tf+vG3EYD0DXth0t50FipLYPYo85Vn+VFChjUnxxkRDTOrBJkN
 RcP7Sm64up1SGIbaHMQ==
X-Authority-Analysis: v=2.4 cv=Ua9ciaSN c=1 sm=1 tr=0 ts=69c29570 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=k09oGH0Gmf3NLY7qN1kA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: wihm6ILQsw682nXs9PfX8bGVQ7OFCitW
X-Proofpoint-GUID: wihm6ILQsw682nXs9PfX8bGVQ7OFCitW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240109
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99689-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A1CA9309B8F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-03-23 21:15:12, Bjorn Andersson wrote:
> On Sun, Mar 22, 2026 at 06:08:20PM +0200, Abel Vesa wrote:
> > Recent discussions off-list highlighted that the GCC should vote for the
> > RPMh CX power domain on Qualcomm platforms.
> 
> Your commit message should describe the problem that the patch is trying
> to solve, not the story about how the patch came to be.

Sure. Will fix.

> 
> > Without this, RPMh may not aggregate the correct load for the CX rail,
> 
> "may not"?
> 
> In what case will it aggregate the client votes cast on the GDSCs
> aggregate to anything without the power-domains property?

So my understanding was that RPMh firmware aggregates votes
internally as it knows the actual parent-child relationship and we were
supposed to replicate that exactly in kernel for reliability purposes.

Meaning, in theory it should know to aggregate proper load for the CX
based on GDSCs voting, it's just that it isn't always a sure thing.

Maybe I missunderstood it though.

> 
> > potentially leading to voltage
> > drops and system instability.
> > 
> > Add the missing power-domains property to associate GCC with RPMHPD_CX.
> > 
> 
> I think the commit message should be something like:
> 
> """
> Unless CX is declared the power-domain of GCC votes (power and
> performance) on the GDSCs provided by GCC will not propagate to the CX,
> which might result in under-voltage conditions.
> 
> Add the missing power-domains property to associate GCC with RPMHPD_CX.
> """

Sure, will respin with this commit message.

Thanks for reviewing.

