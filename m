Return-Path: <linux-arm-msm+bounces-105998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Ar/FV0d+mkJJgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 18:39:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E878D4D1795
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 18:39:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E7B9230360B9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 16:39:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 559664921B7;
	Tue,  5 May 2026 16:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M+F8y2Fs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VuMFEPFL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6567E4921B0
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 16:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777999153; cv=none; b=PUSyQEWgqy2kQxyX+IcJOxbwf4mLcUlva2ylKqDAVpUl0GhLo5RELv9U/SK/bxYMbBvbEuddSqWjylSZd2EZ7dVVhTjz8uy/8lurpGLoJfVMsR6SNosFnpVGBa2tTtlKvE7wtBuXnI0kRZK6SzxlbzAaNI3LedrTaCiXrpFkWcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777999153; c=relaxed/simple;
	bh=xyEx4G2wKir++EItxT2osj5+hfVEdh42Mr6R7Zl3tOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jLx2ukil7lvUHp0hnfu5/4XEfBtPCR2MESRrbmmQLi0kZ05d3Fs4kUqA0ccB9WlQf1+iNXB/Bssb+zZCdXOdazB+4zl1ehyZInyksbw8sL4yJxMKIksEW5va8RrCG/CK/Yi3KVdX1O30bFHuRMRwM7uaoL1FkzVPYVTkjU4Eli0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M+F8y2Fs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VuMFEPFL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645FFngO2859060
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 May 2026 16:39:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kcvBYxHAlvNI6sLP0AoxikyR
	e9LehpKzs6txgD8Qv9A=; b=M+F8y2Fs4/hg36XqYjUZ2aG/CZNEeOdd7UKhLo9j
	8Y0UqL088LknMkhUQRRyzARuoO+oNdGh9YxrOOAxY/U7s1HsLB3jq8q8b572Tqb5
	2J2XraWuZBz9LdfA9uEUNIDzVwbtTmdX/TNaSRaMM6PHAW6gsR0T2etdCqgyjR9W
	OtKYqNDll3aDE4gWGrusBKXkSTVYtXtVbLt7Z4gD7cN8n6QH/CpYQCimZn7DQWrF
	m3GQg+lAgKMKOaKN63Lthabq8F8NRozdfQsqR4fdsT1/DalMjesfDByXRSWYZ8Ws
	d0ZxdzHiQipQdq+w9AFeL3epabsWRpQeHSAmWpEXG/tBww==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dye0ahs7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 16:39:08 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ba718173d1so4991475ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 09:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777999148; x=1778603948; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kcvBYxHAlvNI6sLP0AoxikyRe9LehpKzs6txgD8Qv9A=;
        b=VuMFEPFLEnWQfKlZNxTOy21MJ4cTuCEYI+jFFeGNEuyLcV61JFa2+/bg5tns4qzngr
         +V438+52M4/+U12YdSyhzaytn22IZ3Ca5TNE089SIsSAMs4YicVY1RGxrW5ki5xmbdMZ
         P5BHwB+e3rXSdElDvbIYTJtmC5ixF6zRKor+UYDFWgBRY951cUmuDXnSEAGHZbdNVOSk
         y0fOQY39aHi3gpRKiC0JWq271Ps1eER2XrDly2dZ60B79naNbPkMJ0QdOndwIY4I8CjS
         EDA2SliByOW6fQpnoY6tBsUSjmS1kSa+xcu9JPyrpzsG0QCWT/modDBSGCppXq2yKveV
         S1Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777999148; x=1778603948;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kcvBYxHAlvNI6sLP0AoxikyRe9LehpKzs6txgD8Qv9A=;
        b=OfVgw7Da0MB6M+mkvt0v8npm7XK3zXT5eZ50lMaM8Vtb+T6rUnjsqLdEJbWRZfyk2F
         DCpqDgxNJacui8wxfh77wB6FG/S0ofb1s6EsSHQznamcPHgMZtBBjBe1IOrmgqcBrUiA
         g8Jn7uipym0M6mxztCFyT60JxVfmYcztwBlFCnioylwwfU3hCKY0Zf+F+krL0wdQhsfK
         PsAmw1l56DKMrZy3BJ9y4pviY0ECA/EauvR1n0xuZ5wUkoN3ij1ABoUDYnJC3/gwz/o5
         208+yvzdHQgJYvtbQ7zeVCdkWl684p4UBL4JGr17Jxb+zoOyWccd+cpDJmT3gmh0D57z
         QJ0A==
X-Forwarded-Encrypted: i=1; AFNElJ8spC/d6k6hZXnljtfPiNGF2oA7OEDU8P4xeM1lTXE0oQ9+TU0CGn+P+iqVs3fiOEN5xWz80B+8iEX42eWN@vger.kernel.org
X-Gm-Message-State: AOJu0YyI+J/+TV/zGcAVkX/1O9h8y97xNXnUErsctBQfHfYkvQdLFLr1
	saJ/NE3kExq9OThrxMDI4B/zo5ODA0vN6TRbiAPe8eXQNoT9UfPXUsks+WAJJ5I/wgNQ8YdQ8nF
	YypHrPmpVweEJqFQCuimhLgEBs8ykIlYWzRZnwumQfR7EzJWbQ6PAdwGHC80pZzYiMrRg
X-Gm-Gg: AeBDieut5WWYww+v/iDaL512eOAFGk7hHewKduGfSJRhtMphtSTBxO1ki0jOtXdmE5D
	67gIaePD4ohxtGzHlJ6vmT+bxR7A2gCrfjH2MMhlxp22YYbPEUDsroQyiZLxNbK6t3aTY9RS6y2
	obEynZEpbeUhCUcMagY8WgW36c2G717Qpw3l4KXMwq877Tt5B+dgOI55ty6uL4lhcO06mG4E6o9
	nukPW6vhqkCwRCMVbvahTx2LMs7OqfbYxUxnqhtcxeZP9sGU7tC61aYShvk6WJ50emCnqhMB8FV
	MQLXGfRVqD/iOc5S5PPZ/Z3f5pbeB+CYQ+T5y0Uh7jrTeld6e3vl6uBo8wNV1NL2VVIhr8WwPUe
	z/OY80M5LHGeuAuUgvNIXcOvaoLvVJGO6z297r05zWiR2zQ==
X-Received: by 2002:a17:902:ebd1:b0:2b9:eb6a:68b5 with SMTP id d9443c01a7336-2b9f28348efmr149463585ad.38.1777999147954;
        Tue, 05 May 2026 09:39:07 -0700 (PDT)
X-Received: by 2002:a17:902:ebd1:b0:2b9:eb6a:68b5 with SMTP id d9443c01a7336-2b9f28348efmr149462845ad.38.1777999147261;
        Tue, 05 May 2026 09:39:07 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae15fb6sm148392135ad.43.2026.05.05.09.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:39:06 -0700 (PDT)
Date: Tue, 5 May 2026 22:08:51 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Alex Elder <elder@riscstar.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com,
        rmk+kernel@armlinux.org.uk, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linusw@kernel.org, brgl@kernel.org, arnd@arndb.de,
        gregkh@linuxfoundation.org, Daniel Thompson <daniel@riscstar.com>,
        a0987203069@gmail.com, alexandre.torgue@foss.st.com, ast@kernel.org,
        boon.khai.ng@altera.com, chenchuangyu@xiaomi.com,
        chenhuacai@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
        hkallweit1@gmail.com, inochiama@gmail.com, john.fastabend@gmail.com,
        julianbraha@gmail.com, livelycarpet87@gmail.com,
        matthew.gerlach@altera.com, mcoquelin.stm32@gmail.com, me@ziyao.cc,
        prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
        rohan.g.thomas@altera.com, sdf@fomichev.me,
        siyanteng@cqsoftware.com.cn, weishangjuan@eswincomputing.com,
        wens@kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 10/12] net: stmmac: tc956x: add TC956x/QPS615
 support
Message-ID: <afodG9uuopgfvSmu@oss.qualcomm.com>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-11-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501155421.3329862-11-elder@riscstar.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDE2MCBTYWx0ZWRfX7lgpANXOrq7w
 FSlY1F2hNpHYLcGzRUvKtMFwD7jTswoAXZq+wFU078aD9Ie6Rk+29cSzvkPsl5onKrAC3u6rq26
 UDkoaXzczWWo0BwVnK1TZgUJ8Ha66FxXQYuQ2uzaCVVgbYJ2YcebJJ4hVWcEol7Pzu1E4Bp8enu
 Pm8IqKGRuaLyR6356svIs+JFnff3gqpE7EAw87V4us+HYEdKtpU9t/o5vW7WMtIRpIPakmFP+tD
 9zfmQwiV5HakZ1r+LteFqMYAbg28kdkFF555q8FobVDxLks1hGctyrWy8X95LXomj4VZRXojEAI
 y1yvWi9znQWMrJYPMSNAoFjTrkcEpNlfqhBOzO5FVEeiF0LIFDp32BUoXPRzE8HAOlDO/TC6NCa
 lg2fkPUc/SQjFHfLvMZ5S55nt2jE5B6uOqhGFd7JZ7k05v8wCgXCat5511XvT/At1xBAQEARzUG
 raGTNEfHDcnnGabVYJA==
X-Authority-Analysis: v=2.4 cv=Wtkb99fv c=1 sm=1 tr=0 ts=69fa1d2c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=YOnX06L-6IeA1UCcW-kA:9 a=CjuIK1q_8ugA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: XJIHBYXOEFzFEfNWqb4WJTNGZkOqG9sS
X-Proofpoint-ORIG-GUID: XJIHBYXOEFzFEfNWqb4WJTNGZkOqG9sS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 clxscore=1011
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050160
X-Rspamd-Queue-Id: E878D4D1795
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,bootlin.com,armlinux.org.uk,arndb.de,linuxfoundation.org,riscstar.com,gmail.com,foss.st.com,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-105998-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohd.anwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,kernel,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Hi Alex,
On Fri, May 01, 2026 at 10:54:18AM -0500, Alex Elder wrote:

> +	/*
> +	 * TX956x has 8 TX queues but only #0 to #3 work for general IP traffic.

Minor typo in the comment: I think you meant TC956X instead of TX956X?

> +
> +	for (i = 0; i < td->plat->rx_queues_to_use; i++) {
> +		res->rx_irq[i] = irq_create_mapping(irq_domain, HWIRQ_RX0 + i);
> +		if (!res->tx_irq[i])

Typo: res->rx_irq instead of res->tx_irq.

PS: I was able to successfully test this series out on a Rb3Gen2 board.

	Ayaan

