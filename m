Return-Path: <linux-arm-msm+bounces-100355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMpYBZyhxmnrMQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 16:26:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD2E346B62
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 16:26:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 62CD5305855C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 15:20:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D252231F9B5;
	Fri, 27 Mar 2026 15:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aI1ApZLN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UU33lzFf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940AC2989A2
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 15:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774624835; cv=none; b=gFFfjWbtfvvL3ZzSUIO7I4Lbk+i5jGJaw0h+ekbdlmhNYIsxeBFIrj1R71RtLZCHZG56pag15MUomq8C5TWmRBtJhCg/idbhos3F/fcHQ4c2YjsI/SwDP2F3qiZ6JltAXsjP/4t8eb5JaYL2HhE/zX0GXEI9+SR5NTN14mlkBTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774624835; c=relaxed/simple;
	bh=1lutWRbeovPF4wfoD0ZRR3zRwM9YCc0EsM6OQmir7lc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sl12AVHgm4Os4f06uMfkpGt1n4G7JRpq+LIAtcCP7LBhK6rVyWqxm9jocauHXE1TwR3PnXK9o1Im7/BSwKDqhvN57mgNHRrLp5X3f46ge2Zq1+HG4nMQhsiE8yfZOh18osBmmvMjjPfGuzLKORJG9lC+pBMKA+t8E42r0qi8p0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aI1ApZLN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UU33lzFf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RDhHm4881578
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 15:20:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ss76jAqWiuezivNC5zEZJoYk
	XwE9ZyVbXGzY7OaUfHw=; b=aI1ApZLNF6MrFXweEsidasxUME6VrN4llo6ogWgN
	FK26tugsLvNNXbScTkuQxxJ2x4CAZq4hGVyXHc0Ny7LsJNqyJ8xPfYg468Kktf7V
	poPtCUCMXryEgglpwszTeSqDlXL861NbWRnYNHMiGlznpEXSgMY7tkrs3azJsRso
	0HRi70nfii+izCGIY9q05lXNSco5rCg5mrvCJ6lXbc5lKRbY5R7OKFc//35xUJfi
	mJVnF7SoOLs7tK4tz8dTjqpKut6HGHGPRAntsOlrRLGgpKuiDMWZdemY+T+2WHi/
	NafbzFBBLmEo0jdaQXioYR0rK2HnJOSSBGhiah1xIND70g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5dd6kayg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 15:20:33 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2adef9d486bso44834485ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 08:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774624832; x=1775229632; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ss76jAqWiuezivNC5zEZJoYkXwE9ZyVbXGzY7OaUfHw=;
        b=UU33lzFf1/L6MDe6P/pAA5z5sXoEvr7DEaQy65X3vZzwQ3KvDN6KBz8r2PUa/F+pMx
         t6aLLyOEvxUaMNydVqu6LthIilL2A5aDvR907pVtDmzxFsofxDskV5Rcwr4j79VWcYXE
         YFjWGUC3UDeuXJTOjiE1QkRhUvXV6/LRWLU2FkmmeMCsY97hH6DktQH9i6TbquHor8vT
         zwai5YRi0+hhtaTsnBLzzr5rYGBPCp7ggQpRqJ3BTFEFIWgw2EsCluc+E0pddDRlZL3U
         5BVOWPas9fN2pZu2i3DcoWSQPDj3HUts9yTqycuaMJvksHTPy85E2M7XOr1KoDGxZM4K
         XvYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774624832; x=1775229632;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ss76jAqWiuezivNC5zEZJoYkXwE9ZyVbXGzY7OaUfHw=;
        b=KMFONxEA51dn9+KDWruZvN6C6RzZfd8snzvmrRgSjMfzI0MKOqMT1hsII74P0XsBo1
         e7NkfBXi9AbNI7PDJldTgdPRiE5hXNbHjPLG5MtZsqJ/Cazhs+ViWVLZhd5j2tMy9h3m
         Ih2Spk1Ha/EuiwDH7vBjGIwMJfpe7pQ/gvspbbBkrDOKbl0WeCIItW+sT1JuQcD6XC10
         ykf07IwRi59AsID84ipamWnlTl9J1oJMBkuIXmDBhqN0B7T+Mu8JauxrwYRns51bccfe
         3gmIRrhkSrTr7xQXECFB6DnXSjzSBFoxpUQodePgNgltZlil6gZwkMyKegdMiz9FyCxH
         4tLA==
X-Forwarded-Encrypted: i=1; AJvYcCV7YfRSqlIeLZTSsa97X2/pp7zIuEQuQo4DFPL1QShqXATJ06J8WBiLTF6cyqZ3VD5exx0dJMV1Cwk9gL19@vger.kernel.org
X-Gm-Message-State: AOJu0YyKoOaUNO2NV+U97AtnF/AMUKvYgCqPXnW68QAQGfEeLW4mJWP+
	1wbCAZnDZbebdYvt/tkeGVeTfC+Y7hknaekgOiTf5dkO32DBjdVEJYfvFkeQsR7yMRdVQJxJiyb
	x9BTmzeo6djBSvPvOTqHxE7wMmY1nnz1kADhkdSGgbJ0v7NEM93/AHc7XpnLekJwa2cT7
X-Gm-Gg: ATEYQzw1MjRtrZzk1ZN3j8GdHhG6aRvFtqldYf5yfkxNecW80wy36wwQ/d8pffeoZdm
	yR3cwaQ0DcOBzA2PoCpy1YqPJl+Xk+uWjxi66SosOHEgQ8jcT+qTN30RROFi7oGZxYh7G3/QVrO
	/peykMo4WaXQWdRiWMHKq2SDeFjGoDQXrPdXwb/nGdRgXGMQ4NfT0mcpkOiibZ7xK5PdC2eRc6Q
	wEdyITbqpHzajz3I6uoLfHHdWytIzH9+pM2hiVQadZV7G+TvikdCXTqqQpbwoWvGp7WLCG4nRKP
	SYUMHYKY4K2KzRIDp1EygPE5DiFafumwVYsq+Coj0kVN0h0fPNl53LSn6PqxnNdxr2CuUOAW9Pa
	FNj3PKADgpowxbl4sB426Geg+Ohwmm6v/Avo=
X-Received: by 2002:a17:902:ecc4:b0:2aa:e3c7:6048 with SMTP id d9443c01a7336-2b0cdc4357dmr31891785ad.23.1774624832320;
        Fri, 27 Mar 2026 08:20:32 -0700 (PDT)
X-Received: by 2002:a17:902:ecc4:b0:2aa:e3c7:6048 with SMTP id d9443c01a7336-2b0cdc4357dmr31891535ad.23.1774624831727;
        Fri, 27 Mar 2026 08:20:31 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc8fac97sm60839905ad.71.2026.03.27.08.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 08:20:31 -0700 (PDT)
Date: Fri, 27 Mar 2026 20:50:24 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
        Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next v2 00/15] net: stmmac: qcom-ethqos: more cleanups
Message-ID: <acagOODP2QD2xJf6@oss.qualcomm.com>
References: <acZDEg9wdjhBTHlL@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acZDEg9wdjhBTHlL@shell.armlinux.org.uk>
X-Authority-Analysis: v=2.4 cv=NenrFmD4 c=1 sm=1 tr=0 ts=69c6a041 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=j9A04r5R_e2Fnr00k4AA:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: SSbWv3C-44vao955bxWh1zsOaAF09ya1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEwNiBTYWx0ZWRfX9V9iZkQ4rLQe
 7I+hHBEn7zim1o/ffIVxzg6MMgjHvqRPHDsbOwWxgjARSoJcT3NE+xrYvwdxrxDoA9s+N+Uim1B
 dXohlF34g4G6AvzyiB8zjZc1/9uCslnDJ74WZcXH++A8MAUQHcS9dGIpIS8IrD6JASP31oZ1Q31
 Dp7K4Rydy9ihqMmknfWQJaDN8ujRvjBZzfpi+GwTjeSJ3qQSZL3RheIUATSLfi232Wo3G8P8W4q
 NDLwA6+ilqT9gALhDX8qFKQsBgRWgBEz3pZvIZD70P9IUg87VTcSjZMyFibeTq/FFpe0sE0oGfZ
 HYcJq2QLi/KHj+Y63LUc2VnnITCnqugRedve4RPu2659CAOI+y8HrVC5eO4qHH7bK1xDOyUqx66
 OqmFodC609AvwnAiF1gb2xMTmy99t2HlGKrB9Nk2XT2KqxoUQ/qQUucEdNaMaDN8mzBftFijufN
 KGmrxfeuFI9JDdmp2/g==
X-Proofpoint-ORIG-GUID: SSbWv3C-44vao955bxWh1zsOaAF09ya1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270106
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100355-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohd.anwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6DD2E346B62
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Russell,
On Fri, Mar 27, 2026 at 08:42:58AM +0000, Russell King (Oracle) wrote:
> Further cleanups to qcom-ethqos, mainly concentrating on the RGMII
> code, making it clearer what the differences are for each speed, thus
> making the code more readable.
> 
> I'm still not really happy with this. The speed specific configuration
> remains split between ethqos_fix_mac_speed_rgmii() and
> ethqos_rgmii_macro_init(), where the latter is only ever called from
> the former. So, I think further work is needed here - maybe it needs
> restructuring into the various componenet parts of the RGMII block?
> 
> v2:
> - patch 2: fix typo in commit message
> - patch 3: fix ethqos_fix_mac_speed() comment
> 
>  .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 220 ++++++++-------------
>  1 file changed, 87 insertions(+), 133 deletions(-)
> 

No issues found at 100M and 1G on the QCS615 Ride board with the KSZ9031
RGMII PHY. As noted earlier, Ethernet support for this board is not yet
upstream, but I have some local changes to make it work.

10M could not be tested due to limitations of the link partner. But with
100M working fine, I am fairly certain that this series will not
introduce any new issues at 10M.

Please feel free to add my:

Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan

