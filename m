Return-Path: <linux-arm-msm+bounces-99722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6K4bFh/nwmnnnAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 20:33:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EF231B915
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 20:33:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B2027316B745
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 19:21:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB5D12E091E;
	Tue, 24 Mar 2026 19:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QZ671ADU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WNuC5Dmb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B832C11E2
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 19:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774380106; cv=none; b=Ia/GEOgPE+Wjh7UjX14QVFnUPTE6Tv8F9tDFAdmSCWvWMI+W/ZwssFfHV1NA7Wfayoogx+HokhCYnlTz0TkAAAjKBjDVofcPA7O/otw5dQPYTFQ5g7jW5KXuzugZG2tFHdHJ6fGGMKVWINRMEFnS8xUljefG33u8GbMnmfyi8OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774380106; c=relaxed/simple;
	bh=9lRCq4y9KEjlkVxIEh4unKfzfThqYBVcMAbs21gjAWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aupARTmrlRV8xhM9rEw6GAFItbwkiWWKWnVKaz9M+MdpBb87s2mSK/KZ0KTsyKAKGGeTwDznlGbm9mKHO1GpZ5PafiWgpewS3S4HVWuT8ZBiLy7DR4E/4GqwLlf6T0GN/SLCg6nZqAIJErhjs96x+vChOu9Ij7HBczh+X7uShrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QZ671ADU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WNuC5Dmb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJCstk908495
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 19:21:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ufsntYPZTH4UYkf5usIuMR8r
	MgBSzAD6hXiCAKSWLyc=; b=QZ671ADUTKVgVcJJ0PznXQ1HxJbYEWToHLxPmT+m
	eBLiIl/5EylLsy426GRY+bw4OxUXZUIjhWJeQ8meGZWeABAzzgjLa2ukP2No17c1
	55lmYme+lRIyzP+pG4k+TikBZLNnyABgzcKwN2gh8vVlrGegtPVw6n6ofZSc9QP0
	awP1mvxTLRUsCNFDdh6hT4Alip86SRLc13U9gpqwclUDGXpjWV4lV13msSvp7W35
	o9Q0NLLeBFQGZB2+YoQcr4FmlG5mOBOUbMrvHT+I0wQ3kchJE4/IIrfPYOSXRsEF
	5rwgswniBFPwPqsZY593f9IBjR0PGeCAeeGlWJ0lp8Qx9A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3ukm9cxx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 19:21:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4fe4ff7bso10469231cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 12:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774380103; x=1774984903; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ufsntYPZTH4UYkf5usIuMR8rMgBSzAD6hXiCAKSWLyc=;
        b=WNuC5DmbDYsNidhJIL32VWcokaA/ZjTgDQIcjzjASaMEQ9To8HgbI+pkoaaH6ijYnp
         hNaQjIzFWD5CUQXEpSHFpEeNRQYgyPcm+I7MkFx3AVp0i4Atp6zxlfurCQF+aSpOwDx2
         I8QKA9qpncu5n+k7xqY5YlNnbYMiIhs36WWz8TrBUb9iEqUIAyHFRmXxvTtNwifDoEvI
         Ge3eh0wzTuPjId1i57d5JojCg/HbZyTTt7osianYxB4tJEaBotRXYygFdAeZX+V66QSK
         e7h47SNRfiB3H4riypxMgjWqCoIUX+tHB8PaoJVgapDnV/RjCuOewZsx3Hp/F4pa0BNH
         5tlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774380103; x=1774984903;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ufsntYPZTH4UYkf5usIuMR8rMgBSzAD6hXiCAKSWLyc=;
        b=T7E5/Pr1M2Ha/qz1iamxZ8dh89q+3Fvkx/mR+207r7Ve+kweBJh4qPiJEAR9qnR8j0
         +vckzPvgKwJ9gpuXGTL4/L18oNDik7B4xWimid9KsSwp/NYpuF6+Nj/xtQDlurAHXH+o
         tkixGr+oE/vJIVXysYIIcHDrLL7nH5AOOg5wA3YB0J/mxYH/dxaT7vobNy8RK/qLqnas
         zo9trXEGc5Hf4ckAHqikUNCcFO/Ec4Ev2ugESf+69ie1aF6Njt822mvX9ZOp90Aab5Qt
         JgYEt2fqUqKK1UdgjkAv7vs2mJ+vn378JCMACgF+PVqcW9jHkAjrLTZPFSk9COoORYOT
         Ut+Q==
X-Forwarded-Encrypted: i=1; AJvYcCU1j6qX0SPvrNVJ+JnCTt1Phb3L0OZXEC+aw3G38jAlnKd2u8hjyS6IA9wKTO2QkaOI0IJTwmx++3+t4c6L@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm/Nv2JZcOtEramymoNjdbGmyghNP9YBJWarOAqX80Xs1QkhPa
	2o5wVUueL3vzIQ3uVsgItaMUF0W2eiDpqGPgWl4eZ2AHG94hr1tUnAnuwC97YvkEox/IvVtvg7O
	RqxbwXQIcLaSJ+JXPxDQBMY4wO+YfbgQu+h7IRSe2bDSa47TgOaZJx3wYjCRhZzz4Es+v
X-Gm-Gg: ATEYQzwtam5yGMkWBoa66JHmspLD5cMgx8GNYv/1sg/8uu9TglFQ5aWYUjPaLpcdivv
	ipFUzyJNo3SVPdrNkpkYMFzVnzVGLzso+wOwyGHo+kUA8aTxbaVJBZ9nB41mvz115ugAt2rWlxf
	ABQ0jgfQy1bXOa0XGsLstm5zxmVnW6wptjZBTeqdRIAECGFZaEAJLQcDfZiHHtOQVFrnz6ru9MQ
	H7P3HW7rCURNB82zCk/FsrkJacB+cBsPR4+rbyrDA+d7Ve04ioSJrdTo+MggxN92TzNNrd8pYZo
	fQ+2CyXr+6dpyWu0VA2WpNCCajB5nQCfkYXcJjkOG1cAAlwRk0lrUdyZi3bMVBzPjErjurj9kPo
	2NJOUQICBQ1wNSybr+FHVHAnED+NqpeHR9P6REt9SE4Igie38SpJAgIMTwvnhSnSTanYmvFiYNS
	nR8KTlYsoFo0J4yNrLSpU5bTaaIDFyfAvkdAc=
X-Received: by 2002:a05:622a:1791:b0:509:56e:1b5f with SMTP id d75a77b69052e-50b6ef16524mr64513211cf.40.1774380102916;
        Tue, 24 Mar 2026 12:21:42 -0700 (PDT)
X-Received: by 2002:a05:622a:1791:b0:509:56e:1b5f with SMTP id d75a77b69052e-50b6ef16524mr64512761cf.40.1774380102421;
        Tue, 24 Mar 2026 12:21:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a29a0f1f39sm391392e87.82.2026.03.24.12.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 12:21:40 -0700 (PDT)
Date: Tue, 24 Mar 2026 21:21:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, sibi.sankar@oss.qualcomm.com,
        rajendra.nayak@oss.qualcomm.com
Subject: Re: [PATCH] soc: qcom: ubwc: Add support for Mahua
Message-ID: <bz2xg5gx3xc6kifuoxzn2terw4enqtuv4gd2g7aqoi7ar4mysv@xh74qcddqjvq>
References: <20260324-mahua_ubwc_config_support-v1-1-037d35ff2317@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324-mahua_ubwc_config_support-v1-1-037d35ff2317@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=NLjYOk6g c=1 sm=1 tr=0 ts=69c2e447 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=kCSPC5-xW54M4ESBhe4A:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: XPth1aNthb-M6WXuHQXYwn5xZecXZy0R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE1MCBTYWx0ZWRfX8YamJyiRec3m
 QgRQ1BgXfDGNai8BrNue6cnWtXDPa7ec1eQYnY9R3oyKkb0NaO5tZJAm+pNE6lgdV0bhBfkMZVI
 8A7PTEu289odlKLqKBJf91V2pXjL+hPmCgIEGr4b0jk+0Rr3xent3nT99ivQQoEfK3AKBQrLqiW
 fV4y5BShWfbcf1AQXmuhsQO6sw7SFxcWC7X/I3iH33E6ImyJDkSYpnZIqFGuvRfrug22hxNn8+q
 DyQvoqXbKnIBIO7MlWxt9xXdNpm75V34SvfxUVUBd071cd58Ii0aBodclISek1dA3TiH3Y5QMsx
 2FrmmoSs6+e9IFfuEwRpqruBJS81osbIBcaR5s7i+qhWl19NESauGkQOZhWlyqmdx3jNzXXtrXH
 jehxwxUo11sJA0KMWidcz3JWdqzjeLnpO/jK1Id/EPbbdzorr0McuJA1vjmH6aQ6Uf62BnSElSz
 QUtfKd7lrMoIwZFpF1w==
X-Proofpoint-GUID: XPth1aNthb-M6WXuHQXYwn5xZecXZy0R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603240150
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
	TAGGED_FROM(0.00)[bounces-99722-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A4EF231B915
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 10:14:57AM -0700, Gopikrishna Garmidi wrote:
> Mahua is a derivative of the Glymur SoC. Add the Mahua compatible
> to the UBWC configuration table to enable support.
> 
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/ubwc_config.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

