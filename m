Return-Path: <linux-arm-msm+bounces-90393-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNOOBD0YdGmQ2AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90393-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jan 2026 01:54:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBF27BD11
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jan 2026 01:54:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B9171301B730
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jan 2026 00:54:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D58891C84BB;
	Sat, 24 Jan 2026 00:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i0PDKtu6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X9oJ+h48"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6295D8287E
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jan 2026 00:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769216056; cv=pass; b=FNOIkonaLt7JujUrZLl7grzXmSjruQhOwwBqFsS+/RewVk3rhOzA8G2JjDNvy8sMeIHFdOKP4kINdsqT4vSl4xHrUAcE5UqsvjTdin+oRh6s1/Y947u9ONuIV4+iOZMLFONsx+q7fDCw5yG3Q5nR9Pi/XDVcgZfHQ7mudqugc60=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769216056; c=relaxed/simple;
	bh=/psSTzl/zugWR/YfBzE0v+7mfQXW9IlvaUYxzo1OIfw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GbjFnKJEf6Eeup+FYfJ8wq39OAvCKY16ER2uc8/RIa7WkZnKaNzPAej3B0VXobiTcxEVqCqXApxnRYJ+De+s4LoxmzHKaiHvACoxE+e/jg6gmixDKF64o3ieKgPqCClzAVYNAT8qMTffC1sKMvhyLDS3ZiO+CBMC3WjuikVegNc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i0PDKtu6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X9oJ+h48; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60NI8aHk722519
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jan 2026 00:54:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=ypT2ScJN5jRu324D8R3Gm5Zq8pTI726Gt53mcp0XdfE=; b=i0
	PDKtu6xakoZ4UTDxvtVoxkX8S0nFL9D0WtLVBqCHHMZlY2BsHdrxNWhezHe5apiL
	5rc+1oH0EDiR/Sl5L9CEyUeOtOOmksLw49oL7y4yAMBxn1NjDKMZ+U8YtFTJ0qiy
	Df81JDhUJoiQokaHCkQDLOEJYhDVMNCvO7QeaTvqsPPn2EdplkFxcTHJ0tcGdT/+
	2js9L1OB++qs4LVg2g2VAlKZiUZZ7sCP/qfwELh4GNa+u9OnDIhGXwGQFr2UgK3G
	8iPlPmia2jum1uc1wtVGLuRhLi/QsRpceMuIU1m1XbyW8K6SHuYWBlG7fwsroV5w
	+EP2mjdVQ22uL6SG5mEw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bv069kyc3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jan 2026 00:54:14 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2b724ff60e6so2516797eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 16:54:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769216053; cv=none;
        d=google.com; s=arc-20240605;
        b=MklLO6DaY0ZrTyVMgrxdlwnCHDQsciMAZGX8wW+uWCpbU8YlJIbHWgMGZv9XGrgh0C
         OCsU6pY8U11iwYEh7YORUimLSQAsuhyBbB8MArLu6IFmjxU1SJ0+fq0Vhn79Of0q510w
         j0IpiTy1O+8cwmNzdwvyaVhYY2NXNsOpV7YiR1c/1RpttlZsaqCyHJve4NkJfBzp14v6
         OiZhi4crBxH/NNvqzNJYx6LUdcGYlO6RObvDEZBS/IMo66OAxDec160b3TwGH/3bJcjh
         rTKp94zbBouz5d4UHWtxdnNptz5N9mrHAj0lXCHKz3m8XcBJC7SpPNkD3mKRCoKpOLEU
         D93Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=ypT2ScJN5jRu324D8R3Gm5Zq8pTI726Gt53mcp0XdfE=;
        fh=IgdyPAl0nJDCXPL/G3Qacfu88yhditfpQdetE27ATcI=;
        b=HNJZhAQ2yI6yo8Uc5yFFfGxleK4xeN4nM+SI94a5oJcAyC9Lrm2y2H8B3yIj3pOesd
         oD5Epd1jEA7Ss9lRs6+v973iX/HVy2a3xzU6jamPdegP7R5JGM26hjhc1PCXMhX4w1hL
         NOp+bIKQKpRIV+X8X+C46cQWL7dD/m7q1UDF134epjMZKDyo5s7dkBe0yyh9JQrIzdgH
         cc8Qx2x3xlLjliWDNZtdxGeT5a8K56fxO79QUtSluWFIZjZyaHpZgHzowMSVMl0a0AWm
         mj9qhhhj2WNeuTJmHkZx7NI4UXGdioVUVEN6IIs0YTQMh4S2FCBjzBpzlEK0R18GBRXC
         YO+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769216053; x=1769820853; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ypT2ScJN5jRu324D8R3Gm5Zq8pTI726Gt53mcp0XdfE=;
        b=X9oJ+h48V4arB9nLabDFCY98FrI4pLoO382ZwPui3P3D2W/ypOoVkzbZT2WwuPkSLl
         GLUYFmk/Hgg0gLvk8s5AyJRwsNG3lpZxsi1KldYRFoseQNXkyicm2nQuGRpEW9eN1YvL
         gTxt8ZKqUE9IS90QENS4MDRpOPh6zxEgVf9QxBacB0Q+Q5W9Guc+jW4/KBijAarB7KXi
         u4e5W0M8c12sXzHvxSC62AsTKqmgFWGRZRjgf/moM7ck2HztxkzvjbhYsuuAhjDCgSvn
         HvSsiVptyyExos5xpi9DYDJu2BD9JrY2prOkySygClKmta6QoY/zaeLFN7WeI4tnNLCp
         z62w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769216053; x=1769820853;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ypT2ScJN5jRu324D8R3Gm5Zq8pTI726Gt53mcp0XdfE=;
        b=Bvu/Rd+hHuE8OQXBLgfD1sJrPS4hbAMyealk9BcA5NTI2SyPNpN+K0gv8TQ63eE4WY
         rYkj7Lvs/HUCpm0kcykeLsFhwzICmmyvsRnEnwS61C6gQxA7L/kUWEr/Uzvnedh3IKdk
         d3KI1Htxo/QqytnfGdRnclEK/0dCvKJktupQn3Ps5FH2RLrv8UAAqDWAwUd0PkFq/fxw
         KAURoMgZqJcpTpLNSKFeimbcrb5BeGWSl83/MaR7EbtywO1DAIM34FYEKUeUZ3AS0KYo
         wM7NDfm5UaXPIda99cdRw7LTsgmTDqAOrBYdVxa4Xvs9F4susAxIt7GXX7SZBas1mCiE
         CiZA==
X-Forwarded-Encrypted: i=1; AJvYcCUvb09cGWWSeKPQ/mQxhhxnhf59W5QI0mC73lknr5mGq+d2aBHRGjknVvOFp60agHmdRuwj4vf90AM17xf/@vger.kernel.org
X-Gm-Message-State: AOJu0YyjRMEiX3zecp05IixZsir4XDpH3LKPI2Mdz3WLg4+itqeVncEJ
	Lv53E/jsMCyv2XqF0EYkiH53AE2OrTS4S2CuiqrkOSn9HXZKeniYYodgvseCixRR92BXqzPHxxf
	h18MVkWP/v6+MXdko0+6b7rxCba5Klmckg6o2ctCD/KSU0h5ejkmzbnlSAlqXCCByM8atPGdgqe
	HK88T9fGmXI3ah1sSnt5Z69nGrBUgmh+zBkihrVTb04yc=
X-Gm-Gg: AZuq6aLDxnOi+/Gzh5MBYOhHxvAmAGeLkbt33LBM0zGm1PeImYHtUt5PXBUsPS9sKOQ
	JPvwiUFlBn8V9IjqxF6JNqW45xDxssEg0ldtQTjTJCsVTuks7XxvulRelqi13cUufZWnoaV+QT4
	Vv+tRevORI5PoKRG7/hVDQbOYGZFBhUiR+VUedccjxGQ4ScAeplgXGGd2iwrJk8Y5CIOP+2S9As
	3WwPZlVt+CQxqEaqmue/flDVQ==
X-Received: by 2002:a05:7022:660a:b0:11b:9386:a38c with SMTP id a92af1059eb24-1247dc1d3c2mr2254069c88.47.1769216053126;
        Fri, 23 Jan 2026 16:54:13 -0800 (PST)
X-Received: by 2002:a05:7022:660a:b0:11b:9386:a38c with SMTP id
 a92af1059eb24-1247dc1d3c2mr2254058c88.47.1769216052652; Fri, 23 Jan 2026
 16:54:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251221164552.19990-1-johan@kernel.org> <aWdaLF_A5fghNZhN@hovoldconsulting.com>
 <aXDt6v_iO4EFCqyw@hovoldconsulting.com> <CACSVV039g9CcAKhtMAwn=hH4hMT2nV77vxiasgUSFF-sn=+JgA@mail.gmail.com>
 <aXHwrnMS2aj_PYRj@hovoldconsulting.com> <CACSVV00vk95aYZPrVThoAnHzBUsCHXxnSoEHJNaoLdyJJBOZzw@mail.gmail.com>
 <gofqva7heojs5d7hi2naihqlpkfttjocdazdg4yjqrkeqew5tw@bp57c7rvycpa>
In-Reply-To: <gofqva7heojs5d7hi2naihqlpkfttjocdazdg4yjqrkeqew5tw@bp57c7rvycpa>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 23 Jan 2026 16:53:59 -0800
X-Gm-Features: AZwV_QjZSDbfsgVXlqFUWImTwV-kCK27tq9V8fSTEX_IRAyz8vlv3X-k5-2yZDg
Message-ID: <CACSVV00_FbOuihnFYwda8xxEdtaBEDZ75dtSBPg9oOXTzzR6gg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: fix bogus hwcg register updates
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Johan Hovold <johan@kernel.org>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=eLUeTXp1 c=1 sm=1 tr=0 ts=69741836 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=51pYYRa9bS4eTvwAioYA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: JAI8sGTGdSwHLXF0A2mFWvDnEanSt4f-
X-Proofpoint-ORIG-GUID: JAI8sGTGdSwHLXF0A2mFWvDnEanSt4f-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI0MDAwNCBTYWx0ZWRfX4Uk/Y64ZKAFA
 xfWqKv5hMyFLQClpnGEW4Wdsb3blgQ19dyw/bMWwIE2B2ksbtYANarHnrkyZ6W8mPTe0+2uFX79
 cdS9SnQiql2PETNXcCdvNdCemC3NHfQxN9PF5pP1GlKMxcBey+8Rmx5Mvr73O58MElmo2Hrbq+V
 pwKX9T1yw5++DBHHnqQQ2m6gul1O3EPGAM2fZbgJlGivUNBqvAp2tg2fS9reQvaaO+trEmbg0u4
 1HtwVOAPSVzuUgUUFOEeVVgUJ9FkHPbgERdJCKlIOalzmqtjFIOHxCwL8/PZtGeKhwk2FGSJoZy
 CI8UQ82AiprUxVCFLPiBW6+vap0gy30r79lkLMxW75BmnEucP2DH7zrTO4FSVTMcME3COSaZITC
 R+dUnAEOetnJ9XFAT7yBGw8F9ZFkORisTyUaiygh2gdNwXzXlkh5XAnplR9mrpyD+JtX0iHtTJC
 fvmQMw7USEWlhqqqGMw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_04,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601240004
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90393-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,poorly.run,oss.qualcomm.com,linux.dev,gmail.com,somainline.org,vger.kernel.org,lists.freedesktop.org,ffwll.ch];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:replyto,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 6BBF27BD11
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 12:01=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Thu, Jan 22, 2026 at 06:48:58AM -0800, Rob Clark wrote:
> > On Thu, Jan 22, 2026 at 1:41=E2=80=AFAM Johan Hovold <johan@kernel.org>=
 wrote:
> > >
> > > [ +CC: Dave and Simona ]
> > >
> > > On Wed, Jan 21, 2026 at 08:59:51AM -0800, Rob Clark wrote:
> > > > On Wed, Jan 21, 2026 at 7:17=E2=80=AFAM Johan Hovold <johan@kernel.=
org> wrote:
> > > > >
> > > > > On Wed, Jan 14, 2026 at 09:56:12AM +0100, Johan Hovold wrote:
> > > > > > On Sun, Dec 21, 2025 at 05:45:52PM +0100, Johan Hovold wrote:
> > > > > > > The hw clock gating register sequence consists of register va=
lue pairs
> > > > > > > that are written to the GPU during initialisation.
> > > > > > >
> > > > > > > The a690 hwcg sequence has two GMU registers in it that used =
to amount
> > > > > > > to random writes in the GPU mapping, but since commit 188db3d=
7fe66
> > > > > > > ("drm/msm/a6xx: Rebase GMU register offsets") they trigger a =
fault as
> > > > > > > the updated offsets now lie outside the mapping. This in turn=
 breaks
> > > > > > > boot of machines like the Lenovo ThinkPad X13s.
> > > > > > >
> > > > > > > Note that the updates of these GMU registers is already taken=
 care of
> > > > > > > properly since commit 40c297eb245b ("drm/msm/a6xx: Set GMU CG=
C
> > > > > > > properties on a6xx too"), but for some reason these two entri=
es were
> > > > > > > left in the table.
> > > > > > >
> > > > > > > Fixes: 5e7665b5e484 ("drm/msm/adreno: Add Adreno A690 support=
")
> > > > > > > Cc: stable@vger.kernel.org  # 6.5
> > > > > > > Cc: Bjorn Andersson <andersson@kernel.org>
> > > > > > > Cc: Konrad Dybcio <konradybcio@kernel.org>
> > > > > > > Signed-off-by: Johan Hovold <johan@kernel.org>
> > > > > > > ---
> > > > > >
> > > > > > This one does not seem to have been applied yet despite fixing =
a
> > > > > > critical regression in 6.19-rc1. I guess I could have highlight=
ed that
> > > > > > further by also including:
> > > > > >
> > > > > > Fixes: 188db3d7fe66 ("drm/msm/a6xx: Rebase GMU register offsets=
")
> > > > > >
> > > > > > I realise some delays are expected around Christmas, but can yo=
u please
> > > > > > try to get this fix to Linus now that everyone should be back a=
gain?
> > > > >
> > > > > I haven't received any reply so was going to send another reminde=
r, but
> > > > > I noticed now that this patch was merged to the msm-next branch l=
ast
> > > > > week.
> > > > >
> > > > > Since it fixes a regression in 6.19-rc1 it needs to go to Linus t=
his
> > > > > cycle and I would have assumed it should have be merged to msm-fi=
xes.
> > > > >
> > > > > (MSM) DRM works in mysterious ways, so can someone please confirm=
 that
> > > > > this regression fix is heading into mainline for 6.19-final?
> > > >
> > > > Sorry, mesa 26.0 branchpoint this week so I've not had much time fo=
r
> > > > kernel for last few weeks and didn't have time for a 2nd msm-fixes =
PR.
> > > > But with fixes/cc tags it should be picked into 6.19.y
> > >
> > > I'm afraid that's not good enough as this is a *regression* breaking =
the
> > > display completely on machines like the X13s.
> > >
> > > Regression fixes should go to mainline this cycle since we don't
> > > knowingly break users' setups (and force them to debug/bisect when th=
ey
> > > update to 6.19 while the fix has been available since before Christma=
s).
> > >
> > > Can't you just send a PR with this single fix? Otherwise, perhaps Dav=
e
> > > or Simona can pick up the fix directly?
> >
> > Maybe someone can cherry-pick to drm-misc-fixes?
>
> I know that there is some process for cherry-picking into
> drm-misc-fixes, but I think the end result was frowned upon. Neil?

I'll send a pull request with the cherry-pick

BR,
-R

