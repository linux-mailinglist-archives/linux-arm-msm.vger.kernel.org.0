Return-Path: <linux-arm-msm+bounces-92987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJxdCpkxk2k72gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 16:02:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A55144FC7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 16:02:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1663C3061460
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 14:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC99A31352F;
	Mon, 16 Feb 2026 14:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gDCUIQJH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ERthfw6K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1C5313E2C
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 14:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771253908; cv=none; b=YgOXnEHfeSlUMwzd0JD1ird+kJHW0uA0++lX665KYbrxbZJWX337pO34DE/bV9nx7/xpwusmMa4kSgF4NrEwb1gEYoqsxqd6GRE+Izr2wA8sAEqBTSUvF0+YoG+vDUj00Vdo1SRrbKCL58hik20OC6tNa7MxiCzCNuCac4Eca8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771253908; c=relaxed/simple;
	bh=V2n4xk4W2jjqKrl5B1zT4nsHQzGtCeellUOtxdG6L1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lrNI8Vob5d5fFxfUYs2bTp1LxsE1H4FLAMTzveECHWb2dy1IbpG4CLFL7hXlbfkvFZFOaqZ7tTkUoHGIbilWA8E0bKjgQ9x6zT6C4arZ4IbBLD2lVJvCywzuQXunt3YJcWgYierTox/pbHOwQLyOmjdxz+hy/A5Tezh6/nUI7no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gDCUIQJH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ERthfw6K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GBJLIT3463329
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 14:58:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TlPKEBv6IQ2bElkuTOfHR7LP
	ZVbnNS4TJYo62QJXTrk=; b=gDCUIQJHDvPmPLc2Qo8VfZ7mqC/TUf6wxVzRXB5A
	yS1HtSTB8Y3Tn4oLkg/37nM6zp93QE/WFRS+bJpBVlRVRkL+N67aafT0VS1TFrqe
	N7fgir1bkG2RMX1L7d3YPPTlt6I639iaI18YSxadXX/FO+OW7GEySUv2peuSEbFe
	+fV0xQzOXEbOqyXUMKUZsYFuXx1b4jFY4nqLv1nwhSJZIuJpmCCwnKXEyCKskjWj
	njdAjvHg17/MXVhHCQRboAhQP+K5Ji0OCy9pTIGZjkClHQQVViLRRyPo3eToEsG1
	ChClK87FopGK7H7uiuDw+wO2NL8kyh6O+gNuL4h2EEMHeg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cag24cx2e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 14:58:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb3b6b37d8so1897179785a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 06:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771253905; x=1771858705; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TlPKEBv6IQ2bElkuTOfHR7LPZVbnNS4TJYo62QJXTrk=;
        b=ERthfw6KZUq86uLvgw0ABuOdFJwzwB4b/T/agh+d9B0LYnMA+85cZcxfdihBvUtu7R
         NoYGYGapu+tpaaJDhj0ntFEuYeWdsNJmUJKuBK7iI5bm+eOsclKs8RmY/AiLkWZHfrTf
         aVKNC3h4VytcJomK9nDWtVhiLRUuhD6d9ALMr1KfigPq/Gzetk8YdVMJUkrNlLyz+jxN
         j66maPLYU1R0cmd5DqjRpeByvmD5yqgFNS9X/HVtkBg5HGQtw0fhPFkQvde5LODKUo0S
         jg9vHUxLLDsURuT4sZsFFN56sf9UD3uNSGcccS8RcG+wm+8W9v9d0Au7UMNSbVNjYJAa
         AGOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771253905; x=1771858705;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TlPKEBv6IQ2bElkuTOfHR7LPZVbnNS4TJYo62QJXTrk=;
        b=ndm4GcWuKwBVTfotU6qVRmvMxf9kRbFD20rsEOppGxONM6JQnCNBa+Eaz0v5EoZsT3
         74C4pTJuXg6hJIarhVfR9ClE/SHpYK4UtU5r5rdRXHlMZk9DgxZXSxnxI9diCfgjxvlu
         BCFqIGvyerW45w/PGRzabclt3HU6HzxOMLV1eUVJDR8jsZ9qdj1WAvqMxtMg9cFVn69W
         Qy5vdnppHLW+68aGhtortnbx2PLw9GDxAxkhdgC2RZUPMn1qvaMoMXCveyONe8X4Y5Eq
         obFHf9yt2O78ZA3CwvA+QCW0TFVQGrJA3H2C4ZH6dwpSya7Fh4NPkghxkjsF3KaNF1pB
         zTxg==
X-Forwarded-Encrypted: i=1; AJvYcCWQ/YgXu8UETdqxfkWshn7+CKIzGxw//1hUCGLOrfXpb2+hDT+4jOg0Zx3QwfMz7z+++mO1GOut4N5OMPGG@vger.kernel.org
X-Gm-Message-State: AOJu0YzlFjFSVS362/Itvpc7oviNfGG24ObCAJmvz07vOZulC7S4FXya
	ntWo3ae51kkaR5/ns7yVdYLgIwhjQlBplCoVuRDRpk2QtdD+yTzalIFcIM5/NMvK5NCAkDpVQZg
	j9x63hUMPLy7zKSID0LX9b8UM06vZEjS/hESU9GH9bKe/7lfEF95bxvbo8FSlJpAzfyeNQu6XsO
	yp
X-Gm-Gg: AZuq6aJlDAoyIVn/3XIvihO0REyq3EP58bAZ/FfBnOWb0Ge6Nr+ZsM6tBlRwdZcB414
	qUsMFJcyJFpB6n6Nmn/GMqUGf+GK4n7AFp+n6Vl6tyPhsr2nCtr0U1OPJ6oXjMg6UqPWe4zyjgu
	OD6oVCX08r0UgqyBAHEEuGFGHzMit71so+aJ5XIW6UZX4cJjorkRai6/rwlceqoenTVttTt3mFL
	aCkc3S2jv7QQo+bovuQUr6Mgo5Sx6WmDSMWnTWSS3LhFS0N9BoW0VOw3DjAqeuld5LzMrZYTQiY
	eCckyGO0qrZcKy8xhAwUqUBPtQXM19tfy9e89WlWW7tj6cYL1mQ1p7P8+zxfo7M3HIpMBAcd6nh
	bnfDLqFNMXALYn1AHR2GXDr5gz3eaPf++o6om
X-Received: by 2002:a05:620a:4407:b0:8ca:2cf9:819a with SMTP id af79cd13be357-8cb423c2ea5mr1237438685a.40.1771253905452;
        Mon, 16 Feb 2026 06:58:25 -0800 (PST)
X-Received: by 2002:a05:620a:4407:b0:8ca:2cf9:819a with SMTP id af79cd13be357-8cb423c2ea5mr1237435585a.40.1771253904844;
        Mon, 16 Feb 2026 06:58:24 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796abe3b3sm32479964f8f.18.2026.02.16.06.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 06:58:24 -0800 (PST)
Date: Mon, 16 Feb 2026 16:58:22 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
        Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, asahi@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/3] phy: qcom: qmp-usbc: Simplify check for non-NULL
 pointer
Message-ID: <5k5i7zpr7y2wa5o2odkfyafhoiqk3ch53mwxt24g5thft3htxf@zxz5u2hobcmp>
References: <20260216110413.159994-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20260216110413.159994-6-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260216110413.159994-6-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-GUID: 6VVY9-mFMLQakrGJ73O8PXUmPyYgYv5e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDEyNyBTYWx0ZWRfXx5UR57w23ed5
 eSrXa7NAv4dhLYRJE25TYsaDEZ0HOzopE55zyNxpZRNDqlYEmSH2CHPQGTA6NklfdWKizYjCVfE
 7W35g2J9FbsQV5svHvaX8/9hjCmAvDVOPvl2mQJMQYpO2CD+QyE7EknTJZL1wXyqvb2qt9SLPnR
 aNPuMNV5FAqvXUZn8iq6v96SvzMiyU2OwoHuF+ZCJKbSGBnbAFbju0muGcMttiOxt5ZCJHa2TeF
 a4I4Dx3I5OU/yn+6q2ch33uO8bNw0XGzHhYa1aRKdPXogvJ24ySHMu8vtZo6fDAzK+wLu1WwnmE
 2Kqegz1fd6wgeJ2TVDEXAVUwr+o8RMtmXTByBbTE+U00ntxp/QpUqSORsxviDgjSO+/fk25U3n9
 3nMruy0fMa/iVXrOA7czAlrYJaiKYjfwb6WSGKLDgKKIbWTldEnJ/LWIFwAZCh5lV0uyvLGFhFm
 4rC0UbPGXQkJqq91pEA==
X-Proofpoint-ORIG-GUID: 6VVY9-mFMLQakrGJ73O8PXUmPyYgYv5e
X-Authority-Analysis: v=2.4 cv=aetsXBot c=1 sm=1 tr=0 ts=69933092 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=rQXAbXeZuVbgsyajZegA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160127
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92987-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 02A55144FC7
X-Rspamd-Action: no action

On 26-02-16 12:04:16, Krzysztof Kozlowski wrote:
> Pointers should not use explicit '0' comparison, so just use standard
> evaluation as non-NULL:
> 
>   phy-qcom-qmp-usbc.c:1682:31: warning: Using plain integer as NULL pointer
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

