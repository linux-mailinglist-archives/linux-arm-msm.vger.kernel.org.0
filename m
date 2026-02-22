Return-Path: <linux-arm-msm+bounces-93565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AClJC3l3m2mzzwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Feb 2026 22:39:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 847851707A0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Feb 2026 22:39:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D262E300B12D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Feb 2026 21:38:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF62C35B645;
	Sun, 22 Feb 2026 21:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NwZwDNKP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R93tn3x2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946701C2324
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 21:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771796331; cv=none; b=NqOKFKZTH7YpCRju6lZYkWbRgbYDJwQyKWo2AYdyHgtn64JTGWhBjYCQbsUO3zUEKleLOxg8kA0vegVsSEAdsOnNlhwoxMsWtnAKUDhTRcJo/B8PMAwGJ8qeOFEEIx4DXcw8DcgewAnPFGqlbdHv9df+50fLAvn2l3yGMAXYuOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771796331; c=relaxed/simple;
	bh=gbR77n2bq9x6IJj/6stati7Nk1OGABpmSyjz4Gq+OKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=duQVKcFu42zDlI4kfdpQEP1t8RUu9Ee98rrU9/Ndv3aL7bqOglNBF/vbb5+/s6Xc80FhZAMKZXeIjdrburGYE5mGumdFfgdLS2ab4XisHrR/+yG6aURKBlrlQWB/V9kTpZsQZ/JurYuC/VsmcGLJ+C2CEMu5pZcvzjF4WZ3VuF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NwZwDNKP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R93tn3x2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MJiMFO2926616
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 21:38:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TKAnvBRGucOf46HRe/CFA4BB
	VnTDUac7nLnyWFQ1vdY=; b=NwZwDNKPBrt5B7YoRehV5x+FNT1N5NO2Qzk1ckMm
	F8G1htGgqsvpwbO9khe0NGWKxiIyqU1CE8LZeBUXrsVvxcoV8lnJJl1TR/EdxMZz
	WTsv0r7Zi3BgzjuT0w1mfyJBnnJ8UwZk3I9xtAK9wAWjKFF6XfA8jXF66XKcYatP
	F4O5JJYIbwHzXPYB8tpyNK1ESJw2WeV8yGdEiVGqghM/2eOFWlX9fm7RiRfnB7bw
	j41/UsRhnpBLhDtMOr8Htka4TSBpblfTqfmGktawxqlZ9gyu4tp8EuQ8B7n6qirz
	XHORv253eudbhzyLSIHfUkfuYKEpQO/WF+SzGqA19tSWLg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wk2rdm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 21:38:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c71304beb4so2799891385a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 13:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771796329; x=1772401129; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TKAnvBRGucOf46HRe/CFA4BBVnTDUac7nLnyWFQ1vdY=;
        b=R93tn3x2bydt1tiLpYd42VkQj4gfCjuGrc0h0MD4uPI5WajZWWLU7uQU0aJ8JmyMYi
         qi5TwiOPKJPYcdsbXcgDlCmYnilfaIhQ6LoPcDxWsx46Lrt8wTr6p/QtZXKc29ql/dBi
         1+GVpwGMr11s8mFQgfzVulSstxBSFB4D4J0hjV9bFQUPLx9w/5/cLz3YzNCZfj4AOLAu
         reRQ9ZItVX45/WiE/orv4jcSkzBuFAg6zmK1FVv8XeYDkySfQr5ifK3bnzo/PjVCgHd9
         nON6kdN2P+uUi/zf8CZ/GIuGSWcGsr6rp/t7gsr2GrbcEfXGgsTYnvsKgY7w5GHNhvR/
         KM/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771796329; x=1772401129;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TKAnvBRGucOf46HRe/CFA4BBVnTDUac7nLnyWFQ1vdY=;
        b=oKRE1Lti4AAjKgT5BniG3mx2tTefEgEJgiJkXFOzKUvMUh6zk/WOnR3zm6/tQBXo+C
         5KopasrAkHlBbHM0QjJv6NO/tYHJsqetHYicsiLCyCXH7Wx1iJg17dbx1O9ExouKn7bP
         s9HwVuNeISN7l1OjosU8YQqnBUQ+/iqvNPl9MGK+AuNWV1U/JjOx3obqncQWBE6PUvL+
         3Uilz7uh+aL0Nt09L+m+5TKZuSwt6j8xSV0ULF82jPKD4XMQmJLdAPMMSkqKmCgmDJ7t
         9czCUZBKU7MRsCQKbVxnM1i46gTUaBAx+RaZSF6YU/h7HgmxmM3/+akmFIio5SLCdhes
         uloA==
X-Forwarded-Encrypted: i=1; AJvYcCU9mM6Dt9kz51u8U9gI47mjhMMs4/4uGMePdmKy3srYhY/Bvrsii+E0SJb9wn9OoohQn0HyxtcQAtF3y++g@vger.kernel.org
X-Gm-Message-State: AOJu0YzR25ljzIvoWohKrWkR6DQyO6nCyFC3VJWDXBK4nYhrpINbplkV
	Xoeaw+J+OHIjpksqp7Hr/9wVA7/RqRtZfBc1eM7j/hhE6EdCNiTAfabSn/EmKyL2vppB5lg9xDm
	anWrJR0FCSH+hcVOBRiVauB70OQhBy1Mm0fq7w60djHwCwYJ2oQ1nQePGsBvUrSvFhAYs
X-Gm-Gg: AZuq6aJn4ab+A3Ai+QBRdMtIvU/euHlgZQwxCwkDB55/Kg54ucz9cExDsUfzisPGLWl
	gpjRKuHCt1ZkRUwM0oH2mCdEzvSDWG+UJ5KrdSwYATJppmjfi8JEnniU9+Ms4jm/Zf/mvYG7hAT
	hZ4FC6dU9JpF1OYfBqBeojqZwiJaQr36nWdgQZn1mh107p7JwQfHM6JShChI15LDwj9tJ1jfOqW
	F78jhe1IMIaYssCrnjD9n1pljjexG7W8Ev7JMa42GUxjarMNSNvOZo8W8TWnBRvIV+G1ddyb1OI
	JbFLnV3+zl1nhlneSlDZYUUQAhDU6K/XigHzcR68H5Ff2j6ZLakekWSGieXWMCRL4cjg6/dA7RT
	DKdqZCdWr0rp74K2H2IK22Zc9N/zcqEqo3gjmizS98EFk+HHNjIkTZWXGM9WDUYr4kICWyzgJfy
	gtUINKckLX2lbwk9wxY3ljh5/dPjSordbOdxo=
X-Received: by 2002:a05:620a:19a5:b0:8c9:ea1c:f216 with SMTP id af79cd13be357-8cb8c9cbc63mr787343985a.14.1771796328988;
        Sun, 22 Feb 2026 13:38:48 -0800 (PST)
X-Received: by 2002:a05:620a:19a5:b0:8c9:ea1c:f216 with SMTP id af79cd13be357-8cb8c9cbc63mr787342885a.14.1771796328546;
        Sun, 22 Feb 2026 13:38:48 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389a7a9023esm11132051fa.35.2026.02.22.13.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 13:38:46 -0800 (PST)
Date: Sun, 22 Feb 2026 23:38:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v8 2/4] arm64: defconfig: Enable configs for Qualcomm
 Glymur SoC
Message-ID: <xzehpt4qtadsjxunqv2ysqzhd6motanroe2rft2xvo5kf7x3d2@4iums73jzg23>
References: <20260219-upstream_v3_glymur_introduction-v8-0-8ce4e489ebb6@oss.qualcomm.com>
 <20260219-upstream_v3_glymur_introduction-v8-2-8ce4e489ebb6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260219-upstream_v3_glymur_introduction-v8-2-8ce4e489ebb6@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=a6k9NESF c=1 sm=1 tr=0 ts=699b7769 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=8NWDcoBcKMlp1gHdEIYA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIyMDIwNyBTYWx0ZWRfXzs2wRTe5yHvE
 4iohzx2pK5mvWTFql1dyC8SyJ+VnJANmxkSNkNM/E2usOvuCUy6E9dRLR+znhi6EyknuHdyyCLG
 NnKiFKkN2McaG7YORjBZpRJExWAz835YopoFdMX5IivhXbwYVq9jyqJ4U9ASYN61YZ1bKJ6vWca
 4ZtiHGpdeLIZ+JJL5c8PvwcYaiVHvDGLdREOesWq4K2KjEleU+auQOPSDYL1sYPujfFEmbzMrDy
 iH1+PvhPgjVTr3NDPT1L10KOjvqr6Mn9FzVtApbAuh86lo29oOE2vGQf6SyF9N0veqXNBwOeevw
 rBlQAwT91Qm1XkCsAkloeUKf4dIbXoh5QBLGJY/n+Hk4Sfnvi9AzZKxJBsTOL89mKUarbSMhOtR
 Ps2G2vmIAS/+L2ohltwgyIjwM1rrfmpjsiafSpQ9pyyz7UHJowDCTz6zpuiFSSUap+LdEGQHB1/
 /DzvvCBGjtLInJWeEuw==
X-Proofpoint-ORIG-GUID: WGuumzlioy_xUlNDa0edHkGrUeqcfke8
X-Proofpoint-GUID: WGuumzlioy_xUlNDa0edHkGrUeqcfke8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-22_05,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602220207
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
	TAGGED_FROM(0.00)[bounces-93565-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 847851707A0
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 06:53:27PM +0530, Pankaj Patil wrote:
> Enable pinctrl, clocks and interconnect drivers as built-in
> in order for serial console to be available before kernel
> reaches "init" on Qualcomm Glymur CRD.
> Additionally, booting rootfs from NVMe requires TCSRCC to
> be enabled as module
> Enable dispcc as module which is a dependency for display enablement
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
>  arch/arm64/configs/defconfig | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

