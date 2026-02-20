Return-Path: <linux-arm-msm+bounces-93461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AA2+G2EOmGlF/gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 08:33:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9FF165524
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 08:33:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1C2803020E8F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 07:33:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A53251A9FA4;
	Fri, 20 Feb 2026 07:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q34j58us";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gPuTGfjm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D7B331A73
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 07:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771572829; cv=none; b=O/Gm4RtNoaIU8kv7tuA65yihu0fLk91O2CUIFsuui0BBPj0zHU9crRr+5RrHmrefcT3j8oNyct0dOdpQ60qXr6T4jw9cguDimIx3sPX/Q3DbybsYEJnvYq3TlDCiF9ObbZm/bQTtkLBCXuHhnU0rTJ3N++ZAQlWAazINDzdy3L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771572829; c=relaxed/simple;
	bh=xsvf9jYLQBHdxJveFh1wo9nT6UQDkdrlu1DELW+03LI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T+iUwxkyKMw4ZT0dXEgLa4tDw27dAWDaP15HHqgMZC/gQM9hTpwKcFAHbE1Q2iEFUKz6rVjYBS1AhfSUjIVCzAlZlLYa5eR9SNztARsRIvbVZKF7zyfgZgCGkZJArlpYhxqGausVIDPSzP0ueL2uvWpEWaNhZNfSjHoL/LOprhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q34j58us; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gPuTGfjm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61K5RmCR3697692
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 07:33:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4qV3RCnNtuJMys8ptmXIK3yq
	TjaBi+kJiADEiO/bAwU=; b=Q34j58us3ZFKvTyOKKsR7HHKlHXgTMmIqP+OhCfB
	hfH4FlNralDhDbpYMp8UhQZz4mpDTw7V7fK5MGyDemoX0bPl1PvA7LYumGR/eVCz
	NU7hfCMa01ea+rlqkeYXjbHDI/jcbJd+6v3BjTU+W2lbT2KXZmyQ3QsII5ww6seF
	kV9i/8LiOEFosAZTwAEWeuVC9RRQuE0VCI/i+cxk1XZzwc8j7vn+ahkof8AEiktn
	xg+Et7tB7JcQ3Im54bAgyMzDV5yxGDWPj9anwwv75aOdIEXzTuzFKPf2Ks2xU7Xa
	y5pNYAVmiD/tsLtOlLyVPAOp1wE5DmAZ8BZsMpO03STH3Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ceh5jgakm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 07:33:47 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-352e214cce9so1323090a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 23:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771572826; x=1772177626; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4qV3RCnNtuJMys8ptmXIK3yqTjaBi+kJiADEiO/bAwU=;
        b=gPuTGfjmThFGFJ7vDA/nldhNkVLjQaKBT5RfUBxuqjNqsC+T7HL0DvLi+niqb3P/vd
         Jpetz9KvTcMMtpbLm+poF4R4soFyZqyV/scYb8V3PgczPhQ3v2XWCFadnYCoiwmecR/O
         44c44P1/drLOG2D8GBVdE/E5bpQ7VKLGe+zLzsefSLHoB9dhvq18wU8Cyc0tkN8lx3GS
         ddMH6l+rghliHTXnSsadODh366uns0wieugqhLnwUsBJKb7DPHp3uhWIXaBKpC/yXqse
         M0JZdUgwSjaXDri3LhiWwR9lv2w5ft8YZoRVTbdLiT1YblpFNsvEifNbSn0z4IojC/d/
         veNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771572826; x=1772177626;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4qV3RCnNtuJMys8ptmXIK3yqTjaBi+kJiADEiO/bAwU=;
        b=vijJNJObIKb1nKqYN6hLW/xW8ZYU20W+rP0qfsS7Q5OBsfdkK1QEATZv3uILOmBmq/
         tZe3knoNVKAi7iSpgxRt8reDqQFb+SG5j2ueH1rHKeIYAw7Bxw2h7IDdYDLqopdGswuJ
         9A5wq4CklyitwzZpAy2VCB3/y2KjKz3+sxBYXcWc6yoOEcV4kD/taHUgTyd9wgmPLRSe
         JlfOZbGLYrIHa51UHUAA9lypDusjuan8lz60k502xg9kxJhrBmKVdmcvzmM1mhy9R+as
         B2uyu/6K1Z6csiZiGU/Sgukp6Va7sDafgaSppGo4AjE+oHhO5hQGOmLuUyxemSSHhZZA
         nNjA==
X-Forwarded-Encrypted: i=1; AJvYcCVPci+3xWAcT6cMuHjXZZFh8kwp20GVxmWiyFVEiSnvucERXaqhmEeynK6Wr1n7nEYZA2d/AwJmqaVX6auF@vger.kernel.org
X-Gm-Message-State: AOJu0YybUn+iD0eVzKJA+UorBkKDbwVe+avI7xAPeWBgWVRsn1axVhPJ
	6x6F3dAPMVltA2ZAsUZYk82eULmBAOoc3+0h+nC+qpoI/asF887tpHB9dPtZXOHg6uCbeMCeI2g
	b7CzD2ZeCOzWVg5Xh1LtQuS8lya1IrbVz8QzWccFhZgkeBmJuL0N6Z9J4Bbp9kFsOzb+R
X-Gm-Gg: AZuq6aJjuWsL/WxUn2yiYL2u072CPrJfVzvoO1Wy2gyXk1cI1dqaLqdB+royOdmTjdK
	HIpT2sMpX6I+h2HMWXfrIVv24YglLawhSZCurxGbRriNyyvKr8nfUAzIjNYLlSvdirxfONTl+tt
	wUwzrJP8KG4lLcAsSt8OgY+7+vszgKeBhylRY4mpihFFxNTqQDjbhIquvt68eOsWVE+JqW0uiSx
	nwo9b7uY6U7RDz4W63V72i2QTmJbOshNwqceJ1QnfOMidadT7cblvCoxBPxVlIc2G8XjQkgvmOO
	kaonnrdI7gYGl2f+4aUvTfECrXlQIAb8kK0vPSTw3tWYIs+A+xfnjD4pP6crDYXhsAjOWzThBWN
	enZi1Nso4OXLs1ydjEDIdT3YpOyfxDzID1n3UunPiToz5lkppZw6bsmQbzAo=
X-Received: by 2002:a17:90b:1b41:b0:341:134:a962 with SMTP id 98e67ed59e1d1-358891ca0f2mr5846323a91.28.1771572826217;
        Thu, 19 Feb 2026 23:33:46 -0800 (PST)
X-Received: by 2002:a17:90b:1b41:b0:341:134:a962 with SMTP id 98e67ed59e1d1-358891ca0f2mr5846304a91.28.1771572825705;
        Thu, 19 Feb 2026 23:33:45 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e532f2ba0sm17096468a12.25.2026.02.19.23.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 23:33:45 -0800 (PST)
Date: Fri, 20 Feb 2026 13:03:38 +0530
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 2/4] soc: qcom: ice: Add OPP-based clock scaling
 support for ICE
Message-ID: <aZgOUv+QweA7vE1W@hu-arakshit-hyd.qualcomm.com>
References: <20260211-enable-ufs-ice-clock-scaling-v5-0-221c520a1f2e@oss.qualcomm.com>
 <20260211-enable-ufs-ice-clock-scaling-v5-2-221c520a1f2e@oss.qualcomm.com>
 <bfbe04db-bf64-418b-a75a-88879bf0bf2d@oss.qualcomm.com>
 <aY7MidG/Kcrs83O9@hu-arakshit-hyd.qualcomm.com>
 <3ecb8d08-64cb-4fe1-bebd-1532dc5a86af@oss.qualcomm.com>
 <aZYMwyEQD9RPQnjs@hu-arakshit-hyd.qualcomm.com>
 <6d2c99c4-3fe0-4e79-94e8-98b752158bd6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d2c99c4-3fe0-4e79-94e8-98b752158bd6@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Raedyltv c=1 sm=1 tr=0 ts=69980e5b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=BdqzZBkdcrjdDIVejFcA:9 a=CjuIK1q_8ugA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDA2NCBTYWx0ZWRfX73jGU4V5pW5I
 moFgGVp394M8ri4shemx+8Bt6kVc2YxDn172uInjCVUjC6Sxw06Vxj5dD+O0IpPYfukOkNQsrpV
 vlMtOJOr6Qkk4DP0vuX9MI9pNNoCAR+PwZ9F0sVRUrUzQVrGvudIjZJnPeJnbNBZe0ykiu4y9RS
 XUnBtY1/YAn5m0G8GgQkpJVXMbotlM34KSn2JeilLVs0KlWByDvQDFYo4J6T2EIt3mE8X2J0fSz
 aLXz+PO1PlZEmYkVBneKwBfYCuA2uda5nNXS0Z8xBgU0HPSgFqfNlpfYLGuOialgW1tAl49Ht3d
 MfRdE5plPK9A44ZzMA4SjFv/x+wHrvtDi8+ArPqPagahwqaXey+WzK+PduUHPaz89hkK6qQ8JbS
 q/I/uqQz704pa2Wg4OeddcVb2d1dxtsJCmX6I6ovrXvk8Ww2w7khk+bySeEXiAnpQ54d/IoeVlg
 DF+FkQPjwrsEL4bOEqA==
X-Proofpoint-GUID: PqBICkmDzSxJotZ7ebKoKLmWG9pxjizg
X-Proofpoint-ORIG-GUID: PqBICkmDzSxJotZ7ebKoKLmWG9pxjizg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_06,2026-02-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602200064
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93461-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,hu-arakshit-hyd.qualcomm.com:mid,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CD9FF165524
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 03:20:31PM +0100, Konrad Dybcio wrote:
> On 2/18/26 8:02 PM, Abhinaba Rakshit wrote:
> > On Mon, Feb 16, 2026 at 01:18:57PM +0100, Konrad Dybcio wrote:
> >> On 2/13/26 8:02 AM, Abhinaba Rakshit wrote:
> >>> On Thu, Feb 12, 2026 at 12:30:00PM +0100, Konrad Dybcio wrote:
> >>>> On 2/11/26 10:47 AM, Abhinaba Rakshit wrote:
> >>>>> Register optional operation-points-v2 table for ICE device
> >>>>> and aquire its minimum and maximum frequency during ICE
> >>>>> device probe.
> 
> [...]
> 
> >>> However, my main concern was for the corner cases, where:
> >>> (target_freq > max && ROUND_CEIL)
> >>> and
> >>> (target_freq < min && ROUND_FLOOR)
> >>> In both the cases, the OPP APIs will fail and the clock remains unchanged.
> >>
> >> I would argue that's expected behavior, if the requested rate can not
> >> be achieved, the "set_rate"-like function should fail
> >>
> >>> Hence, I added the checks to make the API as generic/robust as possible.
> >>
> >> AFAICT we generally set storage_ctrl_rate == ice_clk_rate with some slight
> >> play, but the latter never goes above the FMAX of the former
> >>
> >> For the second case, I'm not sure it's valid. For "find lowest rate" I would
> >> expect find_freq_*ceil*(rate=0). For other cases of scale-down I would expect
> >> that we want to keep the clock at >= (or ideally == )storage_ctrl_clk anyway
> >> so I'm not sure _floor() is useful
> > 
> > Clear, I guess, the idea is to ensure ice-clk <= storage-clk in case of scale_up
> > and ice-clk >= storage-clk in case of scale_down.
> 
> I don't quite understand the first case (ice <= storage for scale_up), could you
> please elaborate?

Here I basically mean to say is that, as you mentioned "we generally set
storage_ctrl_rate == ice_clk_rate, but latter never goes above the FMAX of the former".
I guess, the ideal way to handle this is to ensure using _floor when we want to scale_up.
This ensures the ice_clk does not vote for more that what storage_ctrl is running on.

Also, this avoids the corner case, where target_freq provided is higher that the supporter
rates (descriped in ICE OPP-table) for ICE, using _ceil makes no sense.

Abhinaba Rakshit

