Return-Path: <linux-arm-msm+bounces-98257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHzwOrKUuWkJKwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 18:51:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2132B0408
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 18:51:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A1767301384E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 17:51:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35CB837C0E0;
	Tue, 17 Mar 2026 17:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fwd7kFDe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TE3c6ZiA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF8E33CE88
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 17:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773769903; cv=none; b=VpzVvkv2RuXivHWOXrv0VngaCIjSx+/Or14KPIfIxmZf5mozciOQYMJSZO9fmOwxtoVXPTWsRpf80m7dScp76qA6RT3CvkUo8k2pkvE0pj7tDPvjfXK2gPVIidsZrrnhTVwHaDQ4+bH9Jgzrf0LtwAxBov0pXcLapLEVwH+afj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773769903; c=relaxed/simple;
	bh=MGskx+l6rT6m8YMxc7kD+SejuBQipiRUgWHHCtlmoUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IjkWBcynrHuODLgaCATX7c55qdJFBI6lzEVa9vgBt4Wfd8LC6cJU/dpvaVsAtafLbRyfbwLGzBvIuDXtb1fZWDP7merV+mlsljWg/tEychVfO4mIDLopq5c2S1JpvKvmTR9t4AVgxEQ/Yv1Qo7k9inr0xuwoAqSOK454snH92ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fwd7kFDe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TE3c6ZiA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HDbW372906065
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 17:51:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nvowh36G+KcB2cVUdTY42GJw7Z7o+Itk+//u437cGqI=; b=Fwd7kFDerjZhpPxb
	A6uBOVs9b60TOjuh12cergkmJPZy/VsxlQQuz+20BIJkl59a4Gjk8K6rqLywUcKa
	NILOdQmN3z7xndet4opAJHfXO7jQzZxckPyg9S9M0bASS1UCj3a3aqLrTvFx+ddF
	htMbZGgRh0IfK/lWey3u+TeHYkxUy1ybijqEzPU4gWQgJGy2Ok3v+dzrpfpi6hf+
	NNMpZmZCDbYcGZjHpijTXshhH7YyCA/UAzofTYYQIGGX6HjFWQm3Eu1anMUZ4IBT
	Jmc8yYulAVDtlvRSenb41OdC+4lC+9WmZb8VB5dbiMJq1J4cbpdcGbfVq2fSZInt
	AcKWUA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy2jxjc2c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 17:51:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd7d66afceso4031677885a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 10:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773769900; x=1774374700; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nvowh36G+KcB2cVUdTY42GJw7Z7o+Itk+//u437cGqI=;
        b=TE3c6ZiAY0JLdl1QD++qC1MtMrARKIbBG0WRMk+I5nkbEO7eP4Nrd+tm/ZpLtsqy+j
         H0apDvPemcLGW0kMQCp5wJLmDx/uskMhl3uRa17RtDAxI4GqAosG1T8khEiY2YH2ezGA
         t00lQwz7pTpzwMYObRABdxmi3tdqiu7+gCrOrIw4m7gFwptu8RimSZy3zOGsfDJNDKgr
         3aJDJ+Bnk7Hb/9hO9djw+y2Zwmdzz741WYIo7pTlkK2+xOZUNjAgvYslQFgZHBJc33gO
         GHo7hDT6F3Oyf5bM6lwkR9ggDb7QmZhLTKjR15mAbNq2FOVIK5O2Ibyt4ONqduEarQ1u
         /9fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773769900; x=1774374700;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nvowh36G+KcB2cVUdTY42GJw7Z7o+Itk+//u437cGqI=;
        b=IzWNMiiyfRz0DlqkjzEkkM82m0s6li8EzQtpLdGSklYqYwqMAUIrxNiye1QXY97TVu
         6MF3RizvEd+tIRnYlip4fIcs3/7dQJ9/8yimmnFJdLZ7/+RlLwEEvw2Ji8rnoJiU3d/2
         XquXXbwBb47pISucZzv0re2+sb/IcGBshe7qA7ph6JfpLoVwf+l8daQqY4ghVenKYzsO
         nWq3msJ2z22AIAcvr202p2w8rglkOvgwUEXLyYrhYlubDKOVK3ni6+MaUOky2VIjqYeT
         azw48Pbt965g8iYs6a0YPagImdwieEYUXu7FSshotr7uFV4s2ziUsGS6P/1XeU0IE2g4
         ZnLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTrkQlEDeG5Q1bCRRibx+cam93g3jBoAeL+GilCaobEdbBuB4ZlAkiUXLBJSDp4VV3RSx9HOj8drbv++uL@vger.kernel.org
X-Gm-Message-State: AOJu0YwZfGAcdh0NK+VBIES2Grs1r7sDL9GRxGsqxG83Y8TWozl4ysVt
	d4n1CttqcUncaH1Lh+LqQtHuaa9EA/Rig8pxmFPN7QHQM/5OQv0kddcVXav5wP2OjNPi709RLMb
	79DR3JPa5Oy2smiLGVd4Y9IKnvuultuRa3IFgiL8Rcrw3pJoRFtcrDHdEGcCHdlioPB+i
X-Gm-Gg: ATEYQzxAjsntmZiZGQ43aB+9VmDE9/avWi2geHaQ9uKZjHVHCW+TUc7XQbaDI0Wij/x
	93BTt0bpuWkGM8UU80q45QYF4EKtGPI/HM+YcoXz8j/0m/gTCmX6dnau2W3wCnpwgdOx4Jso9PZ
	H80sb7sqwcNE+5yevjhTQ+Veythie11SooiEvMvydek+emPl7Nzp95uqwz0OmWXKYJ5/QxKeaGj
	uGdtAxGJ8M9T8jATlxLeUAbx7a6laKTeY4fRRUML2ekcyI5gYvdU03ldCpFCsvqsSK8s4ExAgMA
	bgiZ2jbir5iIW1dHLJzP2isHP+3AjG4bX3Pa08cf6jJ9SqAHzhopJYxQJ/ulxo/sJxrigRjTYFR
	tkjiRMEQhLBybMpucLVyxkCDui0BzsBk0iSjNq2izLAb4j9HVJds+0Iy6P/BM1tyDHWdxD/ksqr
	rchPkng4aeO3JLnLtc+UWyWSCfCycue7eqvS4=
X-Received: by 2002:a05:620a:4590:b0:8b2:e6b1:a9a6 with SMTP id af79cd13be357-8cfad217d3dmr66111185a.17.1773769900030;
        Tue, 17 Mar 2026 10:51:40 -0700 (PDT)
X-Received: by 2002:a05:620a:4590:b0:8b2:e6b1:a9a6 with SMTP id af79cd13be357-8cfad217d3dmr66105685a.17.1773769899339;
        Tue, 17 Mar 2026 10:51:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a279c7415asm20015e87.56.2026.03.17.10.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 10:51:38 -0700 (PDT)
Date: Tue, 17 Mar 2026 19:51:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        prahlad.valluru@oss.qualcomm.com
Subject: Re: [PATCH 2/2] arm64: defconfig: Enable Lontium LT8713sx driver
Message-ID: <gg5q3cke2asq47vlnek3b3qyqu6kzn43qjhwko7k4gks474rbt@sf5icldil2ci>
References: <20260317-lt8713sx_dt_for_next-v1-0-8195fa931ff1@oss.qualcomm.com>
 <20260317-lt8713sx_dt_for_next-v1-2-8195fa931ff1@oss.qualcomm.com>
 <56829589-1c56-4c96-a9de-505058467867@kernel.org>
 <ablZcxUIJDrrs9Vb@hu-vishsain-blr.qualcomm.com>
 <ba22ae2a-06d4-41c3-920a-f1fd589a2111@kernel.org>
 <ablj7R79VjE5Kb2s@hu-vishsain-blr.qualcomm.com>
 <260c3c17-0d90-4253-84b2-5d53ae4ca975@kernel.org>
 <ablw7hS8OyvlQ/IF@hu-vishsain-blr.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ablw7hS8OyvlQ/IF@hu-vishsain-blr.qualcomm.com>
X-Proofpoint-GUID: pmeUUgk1TSHeCtFmrYa1ST__XroD0NQT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDE1NiBTYWx0ZWRfX+k1VZzKZZtKT
 rUrk2e92tGEiyWcbnYv2BFctqFYBjOu/UAklI+YTr01+wtKrl7XJjnx72seV8SNG2/GSlvxYken
 VttBE++WNK1Kzbouh2G3EfTqDBs7g3ewCpikLrwUBJXjDLtC/9tkKoI7xvrAplTnXNLwebJ3pi5
 mBDFcpkpo8C0iXDoW56/JSWWPZK+aJeHS7XnZGgGaHg+hQDyJjN+nPmYYnCYbKTQtY0vOdOrpku
 bTkgRZkEdBZS5P52uZXBdFZ7ljIFD4kulNy5UnkC5UMVN/FCcFUKaeDhwg5Dca/rRA/I5Py+KkV
 OBY/mbZr6IBgY7hEEQe4iMpmisxWAySGH50Yhjs1s/0DmGNHHdMSfC2R8rLdHJhb/7JDOPAiktQ
 Ew9fb/iKXtF1TD8MdQ+SlcJy6gbV2GiRYSu8KmcitNpnAVUqf7fLwcfx1acWHNI/+gukNx7z4RS
 xOS9bETiYG2DytucWwg==
X-Authority-Analysis: v=2.4 cv=c4imgB9l c=1 sm=1 tr=0 ts=69b994ad cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=fMubUjeo7bVX2tjpqiwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: pmeUUgk1TSHeCtFmrYa1ST__XroD0NQT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_04,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170156
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98257-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AF2132B0408
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 08:49:10PM +0530, Vishnu Saini wrote:
> On Tue, Mar 17, 2026 at 03:40:54PM +0100, Krzysztof Kozlowski wrote:
> > On 17/03/2026 15:23, Vishnu Saini wrote:
> > > On Tue, Mar 17, 2026 at 02:49:56PM +0100, Krzysztof Kozlowski wrote:
> > >> On 17/03/2026 14:38, Vishnu Saini wrote:
> > >>> On Tue, Mar 17, 2026 at 12:44:05PM +0100, Krzysztof Kozlowski wrote:
> > >>>> On 17/03/2026 07:03, Vishnu Saini wrote:
> > >>>>> Lontium LT8713sx DP bridge hub can be found on a Qualcomm
> > >>>>> Monaco EVK board for converting 1 DP to 3 DP outputs.
> > >>>>>
> > >>>>> Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> > >>>>> ---
> > >>>>>  arch/arm64/configs/defconfig | 1 +
> > >>>>>  1 file changed, 1 insertion(+)
> > >>>>>
> > >>>>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> > >>>>> index 1d967a81b82a..c8f89c87672b 100644
> > >>>>> --- a/arch/arm64/configs/defconfig
> > >>>>> +++ b/arch/arm64/configs/defconfig
> > >>>>> @@ -1002,6 +1002,7 @@ CONFIG_DRM_PANEL_VISIONOX_VTDR6130=m
> > >>>>>  CONFIG_DRM_DISPLAY_CONNECTOR=m
> > >>>>>  CONFIG_DRM_FSL_LDB=m
> > >>>>>  CONFIG_DRM_ITE_IT6263=m
> > >>>>> +CONFIG_DRM_LONTIUM_LT8713SX=m
> > >>>>
> > >>>> Wrongly placed, at least at next I am checking now. Look at Kconfig or
> > >>>> just run savedefconfig.
> > >>>
> > >>> Cross checked this few rescent changes were added configs in same file.
> > >>> verified added config is present in generated .config file and lt8713sx driver is compiled with it.
> > >>> Let me know if need to add this config is another file or at different place.
> > >>
> > >> So did you run `make savedefconfig`? If you do not understand review
> > >> then at least follow what I asked for...
> > > Yes, 'make savedefconfig' executed as below, sorry i did not mention about this earlier.
> > > make savedefconfig
> > 
> > And? What is the point of savedefconfig?
> This generate a minimal defconfig containing only non‑default options.
> A defconfig file is generated in my root dir, CONFIG_DRM_LONTIUM_LT8713SX is part of this generated defconfig.
> shall i update arch/arm64/configs/defconfig with generated defconfig and verify ?

In which place is the config entry present in defconfig and is it the
same as the one in your patch? That was the question that Krzysztof
asked in the first email, which you seem to ignore.

-- 
With best wishes
Dmitry

