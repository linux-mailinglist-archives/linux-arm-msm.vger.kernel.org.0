Return-Path: <linux-arm-msm+bounces-116040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eqvoOgdsRmrQUAsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 15:47:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 595BE6F87DC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 15:47:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=gDWo3lvl;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fQqpzdFB;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116040-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116040-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 82BB5303B15A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 13:47:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41B593F5BC3;
	Thu,  2 Jul 2026 13:47:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05492264A9D
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 13:47:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783000024; cv=none; b=s69QZD2bM3rvh8+L2YIOVxx9pgcJTZfTHYnVUi8u0EDUeWJSGX32KqhagPDhsgP136ZOkeOuBswz9AUQQRjBDkpivW6CBd2oLYU2kcpHuojqujChh5qu5IyeUPrM2mQO4UytsMDDKR4YOTUcELz2d3JQckOF3efmqg5dCWQYBAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783000024; c=relaxed/simple;
	bh=JmxphuyWxNE7xhPrIjQD35mjejgdedIacfhP/HoIp+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GmBA7sQmCtyUDoMQ7SpzoYUqYnrp9TfSB0OvijyxmFWW+gMshU/uelki5/G9V4d7KWBjx1vI5oTL7YzZRqG00XqQgoFhvHZdKYJpxbyJIfVVTjAVgIPxHfid5iMt0/TwPKYU/lBTYstUECtWrezZop3K/YqqpYnIaLnYFId83co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gDWo3lvl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fQqpzdFB; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662D0bUH522228
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 13:47:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DuWCAYPQZU3UwxT+0IBmr6kB
	G9d47WD008Fe5KCgWOo=; b=gDWo3lvlu35zx2BjdFyfAjLLbQOy8dOQG1KZjLLe
	9JQ04FEXpn31I9IailLSp9UFBeFMGzLnW+fqzbVFFnrtRPZE5BT2GJihVuZT2oK6
	we6Rsniei/uyAbEDJOegVfgyE26m1713NuJ+VaNViUfc8h6xVwJUd39twI1x/QK2
	fMg1HsXtMBm+49oYxgs6XS+1qoKgBiYHIwGMyBU2F9sw3FOVR6vKacHndts20fT9
	pKtJ2BHW/xkYXN2BkNRrnxgwyeCzcD4iloA2bgDxs+u72H8uUIkMf94hA8tBZulJ
	TKpuzDZNzF90TgcK80zwyT0em2sVbXQSdvx9wOg1hUPyLA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5knc1g0r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 13:47:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e63df032bso58537985a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 06:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783000021; x=1783604821; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DuWCAYPQZU3UwxT+0IBmr6kBG9d47WD008Fe5KCgWOo=;
        b=fQqpzdFB1lL14hgDxyDHhxF1bj4UKc88fYIei6SqRefJHWh7Rt4J6pYA1PDaka7Ygc
         34ZXkLvgW0qWv+RXwC5PQfOTLnUUmLk4yr+pHV5UQVlvs8cJIEdxe21anmvmSjicLOjG
         kVW9rBhBCAaebow/a5D5rRfg+Bz5KA03Mt1s/iiJJNyPSnoPHjxdO2VqgQ5JGBllGdxe
         z4DzhOSsIzJ71GxIPK+scOS0K0Ysg6D8p+dQFIy1e/ksJ1ya1FljNV+g2ttkv/BteoM2
         ekKI97cToU0e7CJvLr4CkR+S4n9j4/c+eMlfNUJQpQaeiEtzS2WDWI8RFB1rFNGJzzBq
         DZSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783000021; x=1783604821;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DuWCAYPQZU3UwxT+0IBmr6kBG9d47WD008Fe5KCgWOo=;
        b=M81fwqtY8HiaoHj1aEzJr/pDDV4m4KxyGP7arCVR75cT7k/TsC4Hp3QZ82HJaCviVx
         EdejACb0og7qD2LMNSHG01vAy1lVxoaoHfA+sxkUcfvWkge/BPZibWImnw5SjEb20Fpt
         Sl/BWiu3K5ZZMrmEAnrEdXQdrCtvJ31LgNcoE3PnemFgA0rczpR4BSaVyGHQwYQaJG5e
         N9LkYehSdilVt9dR6aSCL7cevSYmWHkGVmIx7I976y98QRnHBnFA+KLt7ac2VECdb6wM
         f6qnm1Q0o9+dFr8BxjjDBrJiyz5SIoug6QLlUCoJ8Igm3BWh/uUe2GjufPclPQx472YD
         4PtA==
X-Forwarded-Encrypted: i=1; AFNElJ+DHTVuYar+UA2GuPSV6jAAQ+ecwlhqluhl06uCB+HtKo7Hbev/9gqaUJ2Woq7ZvNPbZhroCUvTVoQYBnK2@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8DAuY7z33occ9KRwDLTNt3dXWiXZMT/S/R5auksDzhywY5Uh9
	sHkR+BbQdT46ef4lOdAPvws49o/jA5bT1H7+5EkHAxKPZrpOZM0Onmj94hC9qRC11p+rFzx9NmT
	ZJgQrYqyzwAGGKZn/UBThQGO/eukIMap9vRK7EV/oDdBDsctqyBBmhCc82ip0jRIgjIkR
X-Gm-Gg: AfdE7ckcAqGQvMKX4M7yl6W2LnOktmUxbYP/2sNHVqLR+hOyGNcmHDfYnyWPuN5CWkC
	BTVPN/UiQFZ93q9GiZYj9CHTj26NwczceoExN9q4pyG0eZat6DCYmghdfopq4nkU+EdJ5eDrDdW
	ldMyBVM1sM5kTi6x/6iz4oQW9d9oTSn111+iAdaA2R2tPARTrqEjvZDDwqRjxvVPSTCJKi9NmtV
	qReAGEpURno4wnGUu6eagYM+pqurI9gPIiLA6tAfCkgbWCaCtTz4qZaJE/8yvV618rRFFBQ0Rq/
	EOFGAX9aI3g8dhLqMVZiGVS4dZRpzcz/E58h83mINRi+E0//4Dr8OMG41PyOc1GbxW4LTiEf8ap
	Cg9MZRJptwwYqGC+Eo81HYOdfQqY9wsxU4c934nzRufzM/AjP/MqP3vDuQ5TyqksQD9IhEHJHJ8
	IgbK50QVXnsfL+gNHi/lHXxfAb
X-Received: by 2002:a05:620a:630a:10b0:92e:7167:3f2c with SMTP id af79cd13be357-92e716742b3mr744871085a.32.1783000021207;
        Thu, 02 Jul 2026 06:47:01 -0700 (PDT)
X-Received: by 2002:a05:620a:630a:10b0:92e:7167:3f2c with SMTP id af79cd13be357-92e716742b3mr744868385a.32.1783000020738;
        Thu, 02 Jul 2026 06:47:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aec89e3292sm676304e87.73.2026.07.02.06.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 06:46:59 -0700 (PDT)
Date: Thu, 2 Jul 2026 16:46:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kathiravan T <quic_kathirav@quicinc.com>,
        Baruch Siach <baruch@tkos.co.il>, Dmitry Baryshkov <lumag@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] phy: qcom-qusb2: don't unrelated bits if autoresume
 is not used
Message-ID: <y46l2xifdzizayovcqksw7o2agkmqi5dcqokt2k5jybjern36b@4iw33qzri3oj>
References: <20260702-fix-qusb2-v1-0-b5cf55621524@oss.qualcomm.com>
 <20260702-fix-qusb2-v1-1-b5cf55621524@oss.qualcomm.com>
 <64f7efcc-1cd6-40f5-80c0-ab5f882854a3@oss.qualcomm.com>
 <3goo36jai5g2v24ijlf7g4gehq5zdlk7uwizya7dimqtm5pmrs@norf4xbqdlw5>
 <3c533783-e2a5-48f3-8275-4cef5651938b@oss.qualcomm.com>
 <e39c9092-30f3-4c04-8bdc-c6400871cecf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e39c9092-30f3-4c04-8bdc-c6400871cecf@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: rL8ajsMeesTyLUSXSjXVnO20kjA8tZyZ
X-Authority-Analysis: v=2.4 cv=a4kAM0SF c=1 sm=1 tr=0 ts=6a466bd5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=gApLsddR9Uy7fhtP5TEA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE0MyBTYWx0ZWRfX8gL/RH8tZnac
 bkycgjGSdaMl73FLQ1qqy6tzZmeGAHfwd3EldAxnIs36TG4dCS9UmokUzdU1z7xdS14uNT0Qox/
 ss5kVZfyERQ8wZWK1tsV/JtauEAFlq422BoXWHhthflppDrpKUCRrYjp7ivZqssJDeIS/uQ5MtS
 weQ5PUcO2zW8HhrfoIQPV3x/MZXEKumGYc2BgBE1Q530j++VCifA1vr1/UuuCK9jgNAJ7sqNFnS
 SqJIIwqo5YvF4mHcq6/yCBw7DVcooIGtU5vOZUVTED2TDN0aoudhNlrFkpGL27qppJIyiTlrn9z
 b9MsvjiHD9Y2u28f1JoQhSdl61OGd9nPPxw+sGbzzFDzIZA/CDFzuSWyp55tsHyV9fYgsvhVYhH
 1fOHP0L19dCy2pKZ/wPa2ETolFrzBeHx8e33v6LCe8HjJVIc1MFYSv94utgQrKYPVW3zS/iWf/5
 yzbRlru7y3J78ztS8hA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE0MyBTYWx0ZWRfX82aeW7eKTPPX
 uf1jkZ6Fm1ivYY3jBDrZMDW0pvBahb0xbS5Fpbm4ABO/fbZIm5A0iVRy9Lq3UemCqk6T9W/TZZP
 iTDpmfcmhcCmmMUjxfI2yIa0yrj6pNU=
X-Proofpoint-GUID: rL8ajsMeesTyLUSXSjXVnO20kjA8tZyZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020143
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116040-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krishna.kurapati@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:wesley.cheng@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:quic_kathirav@quicinc.com,m:baruch@tkos.co.il,m:lumag@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 595BE6F87DC

On Thu, Jul 02, 2026 at 07:13:29PM +0530, Krishna Kurapati wrote:
> 
> 
> On 7/2/2026 5:54 PM, Konrad Dybcio wrote:
> > On 7/2/26 2:21 PM, Dmitry Baryshkov wrote:
> > > On Thu, Jul 02, 2026 at 02:00:06PM +0200, Konrad Dybcio wrote:
> > > > On 7/2/26 1:40 PM, Dmitry Baryshkov wrote:
> > > > > The IPQ6018 and QCS615 platforms don't need to toggle the autoresume
> > > > > bit.
> > > > 
> > > > why?
> > > 
> > > Here I have no idea, the HPG is unspecific, exact details are to be
> > > defined somewhere else. The platforms, when they were added, just stated
> > > that autoresume is to be skipped. Maybe original developers (in cc) can
> > > answer this question. Anyway, if autoresume is to be toggled, it should
> > > be coming as a separate fixup. I can reorder the patches though, so that
> > > at least register layout is correct.
> > 
> > +Krishna, Wesley?
> > 

[..]

> 
> Also for qcs615, in downstream code, I see that auto-resume is being set.
> Its a mistake from my end when I added [1].
> 
> [1]: https://lore.kernel.org/all/20241014084432.3310114-5-quic_kriskura@quicinc.com/

Ok, I'll fix it in v2.

Do we need to enable autoresume for IPQ6018 too?

-- 
With best wishes
Dmitry

