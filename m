Return-Path: <linux-arm-msm+bounces-116939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Io0dJkbUS2oSbAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 18:13:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8ED713151
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 18:13:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="k/gnqbuk";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TEP2SqSx;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116939-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116939-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E662431F602E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 15:44:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F33C3FCB00;
	Mon,  6 Jul 2026 15:42:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991D83DDB07
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 15:42:21 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783352542; cv=pass; b=cku0bdvHyDM6EezmxbKhLXLumeIaP0IxqzN/BuQC5TH6Rvcx4Uh0doEySx4425goC9KI9B+ctH0TvUz8FZCZln0FT9lv8Y6+IOsd2qWQ+lX+CuSwURMvKbpGBjBwpQxlafan8HWK2NLaTeYvZwWear0VbhNn6KUxdxRdGu4vH/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783352542; c=relaxed/simple;
	bh=vxiTjmdRKEJcgCHcsh+xRM1T9V6SfswY5UBXy+kog54=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UPBxPQlDgSV2ohMn4n0n4efF/L6AHjBGAxUJflhuItXUKLN05NR8X9z8dmduZWS7YHSFbCoXHt/b0WjmWHbR/fM2KhTlFYniU46CDNij+FKBmNIFDj4f1MWmgT8tU+wxaNJQU/8MDEHhggNOzvdBu3WQtZD7F6fvHJJLBSzaDBM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k/gnqbuk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TEP2SqSx; arc=pass smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF6ts947329
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 15:42:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BZcHcObQnS5nVi7Y9h8+MwQRY8YJ4tL70k4yQERzNDs=; b=k/gnqbuk0Trr8pfa
	jkXx0HGDlJo1mkiT4zQYwQyH6hINsliO5RL5vxgjAvw9DgHGfNlnP3ndAK7CLHwG
	d+3cGDzsBka7pDwGWw8nerKqVeDmZjVQxRNID1hQsIkgMSiueW65iTFDq+RfBn9V
	hno83aRMV/skzuMr0hWtXdBX4t4t6aBagG8jokO7wQWBS4uM4HOUY6rZUMLE1D1s
	XzvuvwyT7Gim5nbfANBUwvhK4dUF2b2WPdk875p6k3yHGotHka1FQSp6a7xULIkH
	d2M5BCcOPhkFL5EP1tC3NOR9FMmAAji6UjS2BYMGKDgLnoZKOc+AC2Zq/op/HYhb
	qD1lOw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h520gm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 15:42:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92da6f3cc81so388351985a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 08:42:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783352538; cv=none;
        d=google.com; s=arc-20260327;
        b=YhEabuM6EPKCaKDTMBJD/aHzOl5pOd+BWQCIVrLVl5hBYU24UhTfMY7Z5CUSEdJqrT
         FLr5A0XOmTeMH/nugJ/MUluFcqmr3PyW3YBj23m+YEn+MmuTnpEnqqxMf09NRPZgIiOq
         vnQm1o6cW5kkzf/05wTj7zSzeHJwvUEwFVApe3WNlcbLAQLqx3z8OkeT2lsgFI+q6fiT
         K/sRFhhkHCodMDRovtfd7rVDJNYNZfHEPsiBBOqmofqrgsH0v2ym/7OLJOiUK2L2BKpS
         3t/+ipUuue7td6D18jTiVXXn19n21b0sDCFRxee/K8iC9saYZm2AyNMZU7DXuGvDf5jL
         xdHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BZcHcObQnS5nVi7Y9h8+MwQRY8YJ4tL70k4yQERzNDs=;
        fh=xoyetQq4uY8eqBcspo0iEbhBDLwlKI2Kb0h13lDH3O4=;
        b=TLqYEXfXVJrha7tXRzQg4tcgoqzMmW5Wzt8dRLJD9n93QhOFRouj4iykDQMEuGxZRA
         oX/E7NQY+R1AsYKJGLBGjYRkcpNyQS/CMqlyaPd8FmNOrEhLFS+A6Q2kt1+V2hpvCDr3
         e4+OjvSujrCeUCtVgPpVMCVy+5ULdJtznunxv6f5qZ+CrcaP25mLukmZsdpRErIT2Ll2
         5cG71n3iBcZNOx1eyQv/+9ILuQXIFruRhmpIpPpEqfll1Ab2OIq89VhIxeki5Go4+3Om
         ol9vjEi6upCVC6mwyoMd7rGKRNs8Ogrf0YzcQJpXKkilTbme4o8U//JPUpmzFOHJWq8i
         ZY5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783352538; x=1783957338; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BZcHcObQnS5nVi7Y9h8+MwQRY8YJ4tL70k4yQERzNDs=;
        b=TEP2SqSx0Fe6LY/ABPe77gTpTcux+D0IJE3u2uy9EXBhoW1fQjIG9igFLqEzWDUoc2
         T01Ak5upLnG29b9N/JQkS3dL+JgBgLL9brYEhSDgpzW8zW86toGBOuoEZBrxXpsbUM72
         WC7O0UYD0qdkYQON11hcvrwu4C5Uc25qMk5OEHWD1NCeafnbfjrsYl9BTJ39xH6o4oCx
         7Mnrqr7kNwKVlYVWyJEyqujRct+Qghwn0bycMuHXhsgr7azOSCUlpPP7uvsiCheMnLYx
         vt6g2devQ1lepeiMpS2o9k/BMnKkYbflg1sDtVWoZPy9aDMoT+OF8AQPK/8WZ8ZGditm
         CBgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783352538; x=1783957338;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BZcHcObQnS5nVi7Y9h8+MwQRY8YJ4tL70k4yQERzNDs=;
        b=g6Pevwpm1YUgA9hkw+eIPOIyacNC42atK7EqZMJ8U2YbY8D42njjp0/f4y6eBlXeOZ
         0Omz4v6L9Hew1WrT5dIGNk3DM2LZbOzkoPVqeDft5sJCZPJAoJHAlvMYN/GRl+JPTdJG
         gEli4U14BxHlMvNwQLbetWFsCyCD2zQ/yK+dOd+PMQoY2uV57sUHwPDojv5YY7BEzvHc
         wzvcabI/dBAfn26PQJd7ffxUBD0KHUIBTkEg0YMGw8im8LnKEcO9SeLejMoxQmoXvV1q
         23NqCI6QfCwyKK8AOEruAOZFCrEdDO/l23IeLa1qm4crr5xdtWc6N3SKPmULpQYUFINI
         iAYQ==
X-Forwarded-Encrypted: i=1; AHgh+RqRGaW+J0s6hG2nhtsoRTQOwVlDj6ggiALIoir13FYOAGh8Gsp+3V/S6Kz2KeTVDCIcmcs0gjsxyuBrtZ1w@vger.kernel.org
X-Gm-Message-State: AOJu0YwbuKg7z3Bc6N5j6g5icEU+X9ux7tv9TphGgGj0ONFwuP2/bpkC
	F2iIdP8+TqErEVY1JxBpIXfk6Z3xprYTQE5+73K84+pvHfrbWuqR/kWTw/iWVmzojCOIIfEeljW
	ZhT0OvUCg9Uxun7B0mPNvHUiZKD+jn2Ef9bSya7jygn0irbMscCAMW/pNsHVa/pYhQV+WgMcKhb
	JnVfnPK8U+rzzozBoNiuxjC+0YkB4TBMMpVLuM52gaOQg=
X-Gm-Gg: AfdE7ckenOnPQZeC85uet2egXYYoX+4xRreCTjxPTVRpw6qorOBmMm7FyIA0/HS6oHz
	5UeQITmIbpg+i1l8O5MgYYzenxX8dj2KdblEMu8EYJIkRb85ealIEnpwb53joBvH20VWMZ67Wdt
	OGiNksQzk5AaTCrRD2LF7Y6hSgXHc20OYnJlpoj9d1YGRhE7AHKAM6Pg7z5NiqS6RpNst2whNbN
	ol1tA8MyOtGpZEE7+rtKEER4dXCFBCLvDtXyIjLwiHGrj7dMPhRw9xS3Jp9Vopp4Jpp7Ukr5Px3
	LNNvdMYCt7U=
X-Received: by 2002:a05:620a:2713:b0:92b:814c:fb2d with SMTP id af79cd13be357-92ebb589766mr161261485a.60.1783352538078;
        Mon, 06 Jul 2026 08:42:18 -0700 (PDT)
X-Received: by 2002:a05:620a:2713:b0:92b:814c:fb2d with SMTP id
 af79cd13be357-92ebb589766mr161255685a.60.1783352537646; Mon, 06 Jul 2026
 08:42:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701-monza-leds-v2-0-c1be0b472926@oss.qualcomm.com>
 <20260701-monza-leds-v2-1-c1be0b472926@oss.qualcomm.com> <20260701-pulmonary-passably-c9272ba25533@spud>
In-Reply-To: <20260701-pulmonary-passably-c9272ba25533@spud>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 17:42:06 +0200
X-Gm-Features: AVVi8CeUJ6pVzmV1-XSIDcim_YRtoWjsN5T2iK6exKESLTqle6PByMrsNMzBRkg
Message-ID: <CAFEp6-15kG6PhZ=C=7j1dwCGnaoYX4k3pm90Q+LGWDG8VaHuRA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: leds: nxp,pca963x: add multicolor LED support
To: Conor Dooley <conor@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: WUwmAXmX-E1hQ_IGSNAwPvb0-K9mnCgA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE1OSBTYWx0ZWRfX0bLruEy7I6dX
 ItcWOX6+7u8+YngaYSs7KcH/mRdS9xQ5YCaYkb1HePlV+FfLFgtneYgKth9qvVUf+euPRGkWh8n
 9HqHGsRFscst2n5XukT5MefYruodR9c=
X-Authority-Analysis: v=2.4 cv=EPU2FVZC c=1 sm=1 tr=0 ts=6a4bccda cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=nomciOSXjZiP-vvF2YUA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE1OSBTYWx0ZWRfX6w3ibe6HbKzi
 b41QZ2eHH1UMokTWegR/otVVL12WgbgW74zxTyfu34msgsF8bxPQkIOoYe4KwUHoTeAl1j1z/Pl
 QebuXE5hvmqJr8oUWR0JcMmUPrgvpm7+wf679Q6BDaChLqWIYaIR3kfrWsaIfgbCLQYTulTqmOd
 5nb6zwZsQH1RGIXXawETZnyqJlnYYRn1mlxE2Skc6YO5QJCU4T4nI7fB0qfJczT8O3iltb5ADHc
 t+1oN3wnmWQs4YGQxvTZV7s3aFYdat28OzYtizXP/95Xz8Jv9HDzLAgjAoPGYueJlGZRK6GFkc4
 xc6DW1HHShwZs4deDF1zIxXltEVAyunWdyy9RU71yqcKb+RRLznNZPA5TzxFNpl9d6Mn55MnyAk
 ztaR5anZ9WCih2zl6GrxOl5tPvGTu5J1zTbILVBxHJYySMJ4vweFhehrEDFL6Swnya58sHAfgLB
 JLaPeoN9DtN47Vp/1lA==
X-Proofpoint-ORIG-GUID: WUwmAXmX-E1hQ_IGSNAwPvb0-K9mnCgA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060159
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116939-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:conor@kernel.org,m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EF8ED713151

Hi Conor,

On Wed, Jul 1, 2026 at 6:58=E2=80=AFPM Conor Dooley <conor@kernel.org> wrot=
e:
>
> On Wed, Jul 01, 2026 at 06:15:51PM +0200, Loic Poulain wrote:
> > Add support for grouping individual PCA963x channels into a multicolor
> > LED by introducing a multi-led@N node pattern. This follows the
> > convention established by other multicolor LED drivers such as
> > kinetic,ktd202x.
> >
> > This is necessary to support and model hardware setups where multiple
> > PWM channels drive a single physical RGB LED.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >  .../devicetree/bindings/leds/nxp,pca963x.yaml      | 79 ++++++++++++++=
++++++++
> >  1 file changed, 79 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml b/=
Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
> > index 938d0e48fe51bce82779c4457c8e99cb6d80fe70..04b05b8195c18ae9fc1c1cb=
9d3c694d819ea88e5 100644
> > --- a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
> > +++ b/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
> > @@ -74,6 +74,39 @@ patternProperties:
> >      required:
> >        - reg
> >
> > +  "^multi-led@[0-9a-f]+$":
> > +    type: object
> > +    $ref: leds-class-multicolor.yaml#
> > +    unevaluatedProperties: false
> > +
> > +    properties:
> > +      reg:
> > +        minimum: 0
>
> Some valid looking stuff from Sashiko here.
Yes, I'll address them in the upcoming v3.

> On this, was this meant to be minItems?

We really want to bound the register values.

Regards,
Loic

>
> pw-bot: changes-requested
>
> Thanks,
> Conor.
>
> > +
> > +      "#address-cells":
> > +        const: 1
> > +
> > +      "#size-cells":
> > +        const: 0
> > +
> > +    patternProperties:
> > +      "^led@[0-9a-f]+$":
> > +        type: object
> > +        $ref: common.yaml#
> > +        unevaluatedProperties: false
> > +
> > +        properties:
> > +          reg:
> > +            minimum: 0
> > +
> > +        required:
> > +          - reg
> > +
> > +    required:
> > +      - reg
> > +      - "#address-cells"
> > +      - "#size-cells"
> > +
> >  allOf:
> >    - if:
> >        properties:
> > @@ -137,4 +170,50 @@ examples:
> >          };
> >      };
> >
> > +  - |
> > +    #include <dt-bindings/leds/common.h>
> > +
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        led-controller@62 {
> > +            compatible =3D "nxp,pca9633";
> > +            reg =3D <0x62>;
> > +            #address-cells =3D <1>;
> > +            #size-cells =3D <0>;
> > +
> > +            /* Three channels controlling one RGB LED */
> > +            multi-led@0 {
> > +                    reg =3D <0>;
> > +                    color =3D <LED_COLOR_ID_RGB>;
> > +                    function =3D LED_FUNCTION_STATUS;
> > +                    #address-cells =3D <1>;
> > +                    #size-cells =3D <0>;
> > +
> > +                    led@0 {
> > +                            reg =3D <0>;
> > +                            color =3D <LED_COLOR_ID_RED>;
> > +                    };
> > +
> > +                    led@1 {
> > +                            reg =3D <1>;
> > +                            color =3D <LED_COLOR_ID_GREEN>;
> > +                    };
> > +
> > +                    led@2 {
> > +                            reg =3D <2>;
> > +                            color =3D <LED_COLOR_ID_BLUE>;
> > +                    };
> > +            };
> > +
> > +            /* Remaining channel used as a plain white LED */
> > +            led@3 {
> > +                    reg =3D <3>;
> > +                    color =3D <LED_COLOR_ID_WHITE>;
> > +                    function =3D LED_FUNCTION_STATUS;
> > +            };
> > +        };
> > +    };
> > +
> >  ...
> >
> > --
> > 2.34.1
> >

