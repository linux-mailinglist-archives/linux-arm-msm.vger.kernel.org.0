Return-Path: <linux-arm-msm+bounces-102842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BcsFEvp2mk97AgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 02:37:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E02BB3E22E3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 02:37:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ACA343030E9C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 00:37:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8C1D2877DA;
	Sun, 12 Apr 2026 00:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="duhDX+Ip";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Da/uuW/f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9605929ACDD
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Apr 2026 00:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775954223; cv=none; b=OAvNXgWr+cwzPCgmKErUcJXZWN2voDDAEXMBp8NOaUGs2VJiw5lQn4hnGqX38UR4mOV6ebTUsrWg3T8HahoeKAyghpZl4bcCXgAnA5mq6FPIdcDYmK2hkzRcrNQ57UzwDcyRDUFA8isHqSYveBMZo9xJGW81IJt5dgJj/vSVoD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775954223; c=relaxed/simple;
	bh=UpcRekWUAP0R8GR1KCO2fvFkn4AFuGUmPrQ9sVBInIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ogCRBQeJFw20aOvGUa2w8cMR4djnEAFvD/Xwky0A7Z5Up/6AdQq68JPuLF+G1gvN/MxoWBQl5CycIy5IIWvGZdfuHgX9KIEpxOkC6527a5euV3e+5EloHMC9CpB7EC67z3KXb4f2bStwa4PHfpRSA9bj1E3eZ8wiFb+PaYNpqaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=duhDX+Ip; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Da/uuW/f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63BLqbRr2680811
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Apr 2026 00:37:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ihFtdDylnPk9Mbhe+H+0TgYF
	L5uyP3A2wCC6fa1WMkA=; b=duhDX+IpgIbMKTphlJYC6ypDHEzpZDJ2VZEvoE+a
	zVuxyGRwVYaljQx+pW9q6/2kedEAecu2SsR4wBt7TMKDQBXK464Ug5cnR6aYlvph
	Zes+lzxsDj9KSSs4XRC56nWLceWezrQJH+IqlRAZUwPi7Ij1kFg6X+yU6bRPLXvc
	LzSeIe+BoznIIG/E8uZLHs9BUovtwV08VKN0XVAV9++5v+NL+dpoilUgb5Hzx1Rc
	VxS1hpekmh/hCbbnHzZL9ADKCYy5wFoXr8yKRPPf/vJNMT50IH7bSMz905NVIqf6
	f7GeHv3fYeCROAyX3JMb+YwP7U6k/BwcE7tl49MQAT9C/Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfevthk64-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Apr 2026 00:37:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50da529ff48so82569861cf.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 17:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775954220; x=1776559020; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ihFtdDylnPk9Mbhe+H+0TgYFL5uyP3A2wCC6fa1WMkA=;
        b=Da/uuW/fSea3kZT0xWImm/Ua3s9rg1aVyA69ZBU3PV8On+Qh1SNKGrJ7y6m3UpCETY
         ih5LeNP3NWdFnfg/n+zmQUqdqgOAApwF5swx187zicx13ZxNjahWTTMh0Rt49VdqZulY
         KAKoC+BpZuYa5SuxAzmQMGS3CtGbI6HCqlOgl6m/xkIb95HxI553OOtDV6vBNc961yqG
         kb9W274bg2xVqG6vdQ/922ZQ3h8kDKqDxUtKhz9mgiXZ0IAmtgCD2PhKmmQWu0P18wN3
         PIOTy3zHiN7RR/zJIq6dkLuoGMOROyojofGpesYWNUPHBGW6/M72yYHkGbjIQvu63wAV
         D/MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775954220; x=1776559020;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihFtdDylnPk9Mbhe+H+0TgYFL5uyP3A2wCC6fa1WMkA=;
        b=DuFwA5lHPco8/jmirwSZuNPsWRIqcYMKAb+OQj7a5SNDVqe2t1e/wd+0QO5+gKn8f/
         i/NYZeOv0yOvqoft/5NqBw3e7KWQ1K297+dLAv6hfjzH9kJ/w+r+3F2Eno7i4wkA3Gqx
         OU3SZytVLu9zD/sRD+LGh9FA9UtSYx3VMYUpTBvEt/FdViVA7tpW1v84l38QIZrCbZj3
         EhBJmQQ73Tt0LvxBOhxFkbKoGeghrOAh8nXSgD/kowT0ypeqp9/owIxbBN8tll8p39La
         PjPHKj0a+doLg0kVsfMT4zi6HIECtq98UfIqtc0cufG1PgGpd6ujHK1fJYoyVgvV3/pE
         dIKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhVxYqdviRCRBGwx8wuPPStEBkJsrAC4HquYIAu/ETGQJ9oWLrcHiZ2f6f58XxbgM3fF/8/BzsOYUxx2Ga@vger.kernel.org
X-Gm-Message-State: AOJu0YyUcuWR2boSQocmHLw2ytd56zQb8K2d3Xew7Gvqt6O8WWTpOjFT
	8T3P0+t1pLpUfRitBAjowbe/+a1HQqKZT8xzJCu90gRQxf5OxSdMjiHS0o5HHJwmVEcsgaKUeTF
	lBZj8YDyNqAFXsiCBS8sluYmiNP6TmBKUyEnoJp47ZVcRLNL1ISpdjr6b889qbVt3xCgMR3E5y/
	fp
X-Gm-Gg: AeBDieu6qDoYFFcp0khki9yyAvznUcal97bKhwsPDYQAdZd7Xlc1qzDE5RGdFwZU7fQ
	EH6BKi8/+CIfEjCDYgSU/D9MV/zUgSUZUgYhWoaWhOsj45YYY1B6RjTs8awnGPRgfDljGw/4Lc1
	K+af3uasvpx4eaUTAESxkqIhnI5jbYzRZ8rFwM42Xvrycse+FjimwlF9Aozg7QZUMgBjMJiGT4k
	FH0NE9NljZ+ntJhncpH5ogqcFfG1Yk2fi9yQHdoz7I2+A5S6nn2zdKYa6hCmkpRJjx33ZBhmiAj
	Axyg7FrNJNXDd5PcCdvvYwBu3Y5wZVPJIKjKuRqaCL+frxzoYvFzu00EPS0eSvTIRRejk5foO95
	ZmC8WaBE3EhzN+qH+fIzmRdnO1rvNczwLhbeH5A7cbzUfUZPY93jE/IDVl0l0Cga4BlZd3w1voD
	/rxcuwZoihDosdhm0RyZXuGKvdyVZq+JqGg5s=
X-Received: by 2002:a05:622a:8f0f:b0:50b:51eb:c353 with SMTP id d75a77b69052e-50dd5b77801mr83876061cf.31.1775954220586;
        Sat, 11 Apr 2026 17:37:00 -0700 (PDT)
X-Received: by 2002:a05:622a:8f0f:b0:50b:51eb:c353 with SMTP id d75a77b69052e-50dd5b77801mr83875841cf.31.1775954220159;
        Sat, 11 Apr 2026 17:37:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eef071cbsm1708566e87.80.2026.04.11.17.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 17:36:57 -0700 (PDT)
Date: Sun, 12 Apr 2026 03:36:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: David Heidelberg <david@ixit.cz>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Sam Day <me@samcday.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Petr Hodina <petr.hodina@protonmail.com>
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: sdm845-xiaomi-beryllium-tianma:
 Disable MDSS
Message-ID: <eyg2ivnoe7weschcvyuhlzqfnqdfnomxc7b56kuypawj6ui7ds@tkdhm2ckrpq6>
References: <20260317-beryllium-fb-v2-0-36b69dfb760c@ixit.cz>
 <20260317-beryllium-fb-v2-5-36b69dfb760c@ixit.cz>
 <73fyiqoxxg2gg5244wkukepdfw6lnguq63si22qsx2ueyna4hu@l4vyykvn43oo>
 <c746d310-5925-4656-9487-3521cb87793a@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c746d310-5925-4656-9487-3521cb87793a@ixit.cz>
X-Authority-Analysis: v=2.4 cv=RYWgzVtv c=1 sm=1 tr=0 ts=69dae92d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=sfOm8-O8AAAA:8 a=sNNxi8BDMpKHXfyi1OcA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-GUID: eAgMn30WL5fbJQhnhNK37PGbhR1lJZYB
X-Proofpoint-ORIG-GUID: eAgMn30WL5fbJQhnhNK37PGbhR1lJZYB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEyMDAwMyBTYWx0ZWRfX8XO3TFsFggj3
 rXWMO9tCHmcGO0EIU5IHKdjbSsqE3MAnOGOmHkyj1CigN8zJeGTw2KgtqddDYgtOcAKLd4IX1pJ
 QjBm2Oo+bvmSXTJxZ2izwGHPDRnoA+zCj11k8wRAstjcBkZc5s0DQWh+9FOdhLblagG/VFcD8/g
 dCCOo/VlgT9cJvVRL0V1cZsmfl+4/7AQaRSErV12o4x1e8tjJQmyWW4QfktnZ1JElXEXxMRqwK0
 yENbXuITRjKAYmdc58zlxt94vAV0UYxq18Byp8H70fFjAzRnIfUkFMkrNTWhvcd+giqybYbnAyU
 qA0x7kcYhF3uRKJE89YDxdVdM4xz3sFxGkhwa/FYGm2tFkQ2OgOAAH1FtLdlk/m10TZwBt02UIm
 u8UuNzujEEH2IEb1jZYYttJ2CL7xE0e2CMNYhONfuaLJsUhOM2HGfFVA9uxE4zVjleau3BuDK+x
 bb47ZNKC0M/4QDt9EAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_07,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604120003
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102842-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,samcday.com,vger.kernel.org,protonmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[protonmail.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E02BB3E22E3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 03:51:12PM +0200, David Heidelberg wrote:
> On 18/03/2026 15:47, Dmitry Baryshkov wrote:
> > On Tue, Mar 17, 2026 at 11:12:35PM +0100, David Heidelberg via B4 Relay wrote:
> > > From: Petr Hodina <petr.hodina@protonmail.com>
> > > 
> > > Currently the panel driver for tianma is broken.
> > > Disable MDSS to prevent DRM taking over the framebuffer.
> > 
> > I'd still hope that somebody can get it to work. I'd start by using
> > prepare_prev_first. Sumit reported the panel as working in 2020 and I
> > have no doubts that it was the case. Another option migt be something
> > related to the dispcc (see my [1]).
> 
> Sadly, the prepare_prev_first didn't solve the issue. The framebuffer ->
> MDSS takover happens, but at greetd (login) loading screen goes black and
> never restores.
> 
> Will need more work.

Do you see a console _while_ it boots, after the handover? I'd check the
mode programming. Maybe, disabling panel reset would also (temporarily)
help.

> 
> David>
> > [1] https://lore.kernel.org/linux-arm-msm/20260217-sdm845-hdk-v1-1-866f1965fef7@oss.qualcomm.com/

-- 
With best wishes
Dmitry

