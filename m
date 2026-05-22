Return-Path: <linux-arm-msm+bounces-109361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEPEH3l9EGrdXwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 17:59:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1485B7448
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 17:59:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 952633006954
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 15:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B3B431B828;
	Fri, 22 May 2026 15:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V1xbKELn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XNMFxL0y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181D618D658
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 15:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779465378; cv=none; b=DATVhKZmFGXp1cuMS0GjtiI3MmXIfU3S5NQDgsns8g6kOcA84bo/qmgmGUcliUFJfk/Jt86s3jgxqFxCLV2FaVc/rMl14riQwe4gaAIwT4I9+1O9aohTh+1XFS3noCVKYPk+p+2HIp3gamWobMyeW+/nXZMFoW0gjNAskPoUfno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779465378; c=relaxed/simple;
	bh=QwGLipH00Xrr+3msIoEu7uhaOm8InQFJw6raskRiIZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jz8lVXVCTEdHxFSoTjDqGkVADcc5eSt8WtkU7Ku03A3GiVCfo/HhrnCSiN5ws1IsMF1JcSraYO7vuWeKzmE9jV2HYxcSAYcVP1ng4uERCm1oDXXj4HleIP3W1Pyd0sTwqso8t+VVGpxCIR2YW7jk5UsGvS8GQjaeMZwLopol13g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V1xbKELn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XNMFxL0y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MCxljR778902
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 15:56:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=z5gWBtuKrGAwT3qrhQiiIR0Y
	XtC82aee7mytyXlMvEY=; b=V1xbKELnt9GtC51Fwo1tULB2T8tRgxVnd1yefJrB
	LRyGyGoDu4TKulzv4/ywFZU47C14ctx/oo9xZyf2YpvnTkmWt/3VLP4lCSbrqD+8
	KwWGtIpr0mM0Ax4wNEXEFE99XEU5Czbmvghls3CzuXVQBwZnFELzL+wPrQQlSxho
	cY1gw+QHJFPQbzTWt8gqAp0pNzcWHTnU7SASvC8IXpAdvTG3RUE2Xu7L0Eeae5mz
	MbSz4La3pDJItYzJsZaDHpq/14/EuIt2mFd+X54vpqRmUjiSSKO7PDhrVKZta3DU
	NUUCrd04UOT52QPwz3UKkThclIKceCQPOl0kMVZm/d94vw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eac7auhuc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 15:56:16 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-368edd5fec4so8506177a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 08:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779465375; x=1780070175; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z5gWBtuKrGAwT3qrhQiiIR0YXtC82aee7mytyXlMvEY=;
        b=XNMFxL0yAvDLbG/a5Nt430A0L6f++COtKX2MvoskJq8amiIMrDk0+/ueRQ8tVOzpwz
         deC2W/FnDRfD+a55QQspcFwx+XAgDhW8LTpUQbr2xWb0RPIh5hLkE+EQoDtedTEGF6h+
         c07ws+RlT2vHtE/W163IsgyeWtARXa53VELZ5Haw/C1oCPUYlZkSQxbOaxC87STCBEl2
         1RKdOkBJ6/qecUbkqoO6zc3dekvX2q3mbUJcUaBrp9oLfJC86uzZ5rtLT2+G4CUb4kNn
         T8pIzZjaceROqBI3mp4VXdtL0G629FmjnyScTTs0uYup9tVlVzpU6PkH41q0FqudBU3s
         TWxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779465375; x=1780070175;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z5gWBtuKrGAwT3qrhQiiIR0YXtC82aee7mytyXlMvEY=;
        b=J2t4wXXWNepAinwlVs0SQS7sjfyS3/aKE5lYEtJhUTw4KoNGvcxUO1VEYIkG/b5vmY
         xFby8kVAA0N4AW+JbYOEj89hvOX/fJIldvZNX7040iIUwhxiQxxhVQnrFK0BexLYArXT
         wHgmjqH7pncEIUHaERYK76A0BuAxrohJnOKQ02TAJ2/hyDb5Umg6gZ4uk1RkgppAZHia
         IyjBGs1twdo9TbRZbETmtQGvQ+061/GgCMFXamAxvkgLnmII/n+j0LZgP/7BMHnw3oiH
         eJGo7pEPDPIRZB+WWUqEGsTJ3tED9dn5h7IpGalxV9dWA3GXXwWBn3XiUbuBpE5kAdSp
         KFuA==
X-Forwarded-Encrypted: i=1; AFNElJ9Qd9B2PDqqbTaAxXsJvxBHG254WG4DR2MeL4cVDgd5b+0pRQycUIFZR1QUm0vW/FW2fU9yVoYsLKBcbk6D@vger.kernel.org
X-Gm-Message-State: AOJu0YwguS157MDBO6A8555JfekbHpYYT8h6yiDEdrb9T+CtwWkugVmx
	6v62TYG9i6hggqtC3zgBKsbLEcS1EuikuxanQM7PD5Rm1Vq0Lbodec64vu03FMdnvH1ufhlT982
	/MREVY9XfTiqTV0pduiTv3h6RYGCka9rktv63qX1YuIWEOHcJXXpkD0BEJ52rZ5RgpuNFH4POBw
	nR
X-Gm-Gg: Acq92OEluZ5kekOHT/7zmaoVol6odXn8A88yjKl8SmBqvCcWlej7j0VnRp12pn9aHg2
	iWvBl4LwFqX1cknXMx7UhWt1mv3zZ5lHsvY7P8fMqgZ+fThkzqQ4yj09RL+YqUboeMsoaqysJZt
	AWJiuD6GX+5BcqfK23mSuUg6SMS7gpo3dvO6i+wcftdJuXEWBRZaInKuSLvD6C1oDGyJ1UgCGui
	CyxUC26EH4kMxXheYTnk2gjya6b1jpp2sRLvIwB3lTe2KAJJXz5DPlAzdVuq89YzZGwkthBKv0+
	6M5xzGX4kfkQgK/73tldVm6GfTEAQ7vRKLyTcgm+OMneXhesPpdf1dpEfXFzxGhMXY6AOyQbAgt
	8181+LGa3m3g7zD/BjQVoP0oMd/xzN0UXjSvhxSO8fSSTP4I/
X-Received: by 2002:a17:90a:dfce:b0:368:ed92:6f6 with SMTP id 98e67ed59e1d1-36a676f0280mr3760208a91.1.1779465374978;
        Fri, 22 May 2026 08:56:14 -0700 (PDT)
X-Received: by 2002:a17:90a:dfce:b0:368:ed92:6f6 with SMTP id 98e67ed59e1d1-36a676f0280mr3760180a91.1.1779465374412;
        Fri, 22 May 2026 08:56:14 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a71d9416csm3419461a91.3.2026.05.22.08.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 08:56:13 -0700 (PDT)
Date: Fri, 22 May 2026 21:26:07 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] firmware: qcom: scm: Add minidump SRAM support
Message-ID: <20260522155607.dgdpun3yonmklhx3@hu-mojha-hyd.qualcomm.com>
References: <20260519171442.1582987-1-mukesh.ojha@oss.qualcomm.com>
 <20260519171442.1582987-4-mukesh.ojha@oss.qualcomm.com>
 <19de35c4-8ddc-4824-b8c6-083eb53a5e8d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19de35c4-8ddc-4824-b8c6-083eb53a5e8d@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: xWA7GEcL9Vwcp-RYMCnMyKvELnVSzCmE
X-Authority-Analysis: v=2.4 cv=JrbBas4C c=1 sm=1 tr=0 ts=6a107ca0 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=9xwycFMNzIvhgBqj4zYA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: xWA7GEcL9Vwcp-RYMCnMyKvELnVSzCmE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE1OCBTYWx0ZWRfX0p/MK2pvlLQX
 DEkw6zpXI21lYU7zVrb3hMEwVMlDQ9KIzscL840aLDqr7C4WlTML91qr9fHM1ziIz0BeWDejf5m
 D+6KoNYIpjCZYbs34wt+TeWudHfW181tv6pw+rwMIDrx8BSApc7xxNok5zpGols6WKaMyC0jXSe
 1xwhuKi834QGwmJ5H4bmbKMJ93vQCWqJcnFOq99Ta+PiGotlcu15o3ZlEv23cx7HY75PS+dB4Gp
 76t9qJAzExVPiwxOpSGeA9MGssRTXF4kxDIq5NA8kpfG5LFpzc7BVEfNX975tvqK5Pf8RGc4ROI
 0AnUjht0clxqCI0d6MgQNWwGVS//7MiajpYGwgJZ7BkLeoGpnwhfumtwNyY0wsBw6+4BAaACeZW
 SHmAPgvv9FKQ4mCgJGce7nAw6c7q/gOX+sBZ3iLEoAep1A9j7rmkRlNFpvFcl0tH+xKxAIqwiQA
 /IsyhIq2MILRvxtR9Ag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220158
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,gurudas.dev,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109361-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,hu-mojha-hyd.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DD1485B7448
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 21, 2026 at 12:21:34PM +0200, Konrad Dybcio wrote:
> On 5/19/26 7:14 PM, Mukesh Ojha wrote:
> > On most Qualcomm SoCs where minidump is supported, a word in always-on
> > SRAM is shared between the kernel and boot firmware. Before DDR is
> > initialised on the warm reset following a crash, firmware reads this
> > word to decide if minidump is enabled and collect a minidump and where
> > to deliver it (USB upload to a host, or save to local storage).
> > 
> > The SRAM region is described by a 'sram' phandle on the SCM DT node.
> > If the property is absent the feature is silently disabled, keeping
> > existing SoCs unaffected.
> > 
> > Expose a 'minidump_dest' module parameter (default: usb) so the user can
> > select the destination. Only the string names "usb" or "storage" are
> > accepted; an invalid value is rejected with -EINVAL. Changing the
> > destination while minidump mode is already active updates SRAM immediately.
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +
> > +static u32 minidump_dest = QCOM_MINIDUMP_DEST_USB;
> > +
> > +static const char * const minidump_dest_name[] = { "usb", "storage" };
> > +static const u32 minidump_dest_val[] = {
> > +	QCOM_MINIDUMP_DEST_USB,
> > +	QCOM_MINIDUMP_DEST_STORAGE,
> > +};
> 
> Since these two are supposed to live together, could you turn this into
> a struct?

Sure.

> 
> Konrad

-- 
-Mukesh Ojha

