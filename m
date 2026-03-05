Return-Path: <linux-arm-msm+bounces-95684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLsWGATXqWl5GAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 20:18:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B974C217591
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 20:18:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A7862303A265
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 19:16:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEF672EDD40;
	Thu,  5 Mar 2026 19:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SJuY0VFU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WGvjaBuP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820E618024
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 19:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772738176; cv=pass; b=EK9r2YCSzjdZOyx9iobvi/7TeqJdXzIN7ZERoZZKO7Ac4Apq7t6gScRTBQTcwIBV9fFfMHHPUYBJSL6zc9QdY0PPZf4evs9gRl8E4cDsmSkVzjwhH7ZCUpL63CxbusR6vBftZzhjtKJKAJ2NiyFkOMqadRWpME6Tw6nVGa44SEo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772738176; c=relaxed/simple;
	bh=T6mSzgIW84n78L1oui6Tey80VTrBXBQQ2EtxjS8uHis=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FABNcvy2rdd0goBQeSds9Utoi5PdxXlJM/0Ku9l60ZrFntnI7X6juJxS+Jw1hrkxiijwpsHcqM3W/yvc41zC2tCxFfmXE+WuqZdntdjh/ZzTUQkhyD2WJVXG2FFRaw0TOQMrZXXrqeU9whXTPlDkkDEO5p4v9fO0UQsklCkcYTw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SJuY0VFU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WGvjaBuP; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625CNA5S720339
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 19:16:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T6mSzgIW84n78L1oui6Tey80VTrBXBQQ2EtxjS8uHis=; b=SJuY0VFUW+EYt7Di
	8sqA0lDv2LrEAMbxpn9Q2x64m6PUEoW9YgH/jXkxCbmvMnm8pD9ZLF1ryzYyvG2n
	gG+oUsXhxDePWXzGBvl4Efw6F1NotGsFqFaZUeI264z55fjF9ui187Wc2cZerpnD
	QYxrvioO9GptmIlorO9EvrTMUK1o/nfUnZ9iEKji8hJvoblzTzRKhGwWzrxmPZqP
	yri2uPt8QiFuqejiUaTufxn3u2kl64XEL36o5GBZqY9vWL+4lNF7sadkPtJ+4XMw
	jbTQCUQKdf9u1hxFsOv32LkiD8/ZfXRs8hVWGzPF2LiHdEkpfCKocmBzBsYbKz9w
	IR8i5w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq9srhdsa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 19:16:14 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-506549eb4b7so630094101cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 11:16:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772738174; cv=none;
        d=google.com; s=arc-20240605;
        b=gJOBH7d5rr479fmurLGz7wc2d/fYpmraKRhBXNoRAi8B60+aJkNvJiikD8+nO2Vh4W
         77RLrTkr03k/Z8GfZak1UJEn+yBQtpg+pzquExtUApO4Jta3WZdN1iy7aogcGLVXYbSQ
         vJBIIktjr5IYePxWxSDE3Q1ReVzwHb2euztM+LYfduZSlmstQ507Wmy862560Ij2BWZH
         8qZdWRZaje5VI3w1+cWuMDAOFTcuUoBb3/o4rv1wSjHcEO2qiyA3jwcyKUd0HHfvwjr7
         tiJ71QVPalgZNl0J9rJOZ95GoUEhig90XC7eVdco0w4FYwd3KBsBVKb8g4zRibVv0Ckc
         Dhzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T6mSzgIW84n78L1oui6Tey80VTrBXBQQ2EtxjS8uHis=;
        fh=d7Q4PKd3u7nCmODoLBcRGrWzghd43VpCe/4+15a2tq8=;
        b=CcCLe/oUhoEev+0gxpsNc9SapYebtnBd9fjtYmOlCgWdon+nPRC9F3UMZL/SRu8F1G
         aG1RQ4RfLdnKxJFgjBM4hgvzc8KHogFVTGnMZPoCsRwRk/AXUeNdGxCw2Y1HVo0nWe8v
         dGzsIjIm65/qpkQvQJfIsTzcaqjZTdXFrni8Rq5e7a5G+RfHcIDAATGxBSVsj5uYCT8y
         4sjkLMqQKfxhwiMwp7QpKwBDI8cbIay+1yNljtl+qdSkJlNHvfIH8gkjVCEOUpjN7g28
         CCWjia3Pa7w2VWDGexHelTm0G7rmoeI2Y6TebBTOaFJ+reDIE5QOTDcKpcRvOih62pi9
         SH0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772738174; x=1773342974; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T6mSzgIW84n78L1oui6Tey80VTrBXBQQ2EtxjS8uHis=;
        b=WGvjaBuPlZgy4w2ShPaT3kGymear6CqE7+nuTbltWd36jVgl2JhLEZUAbBID8AWbRX
         +NXDP2xN6NcAHHqiLGNsPOZ2LGFjmP/38FexB0XW87PgusqAir+vKfL/XCoMJ+9XjdUx
         2Ghbp7H/pGh+x2Vq0AISrCE6bmi4uiRhMLn2W3VWchQkKWMGFtt37x5tuIfRuGEB7uP3
         AuCqPoac3Anut9ny8wtmDispyGjySo3+oajeJmsnOI968Usvimd1He9jVlgvKc4G+oun
         i6WsBTjiON9/HsrsuesX3SZKMx4ow1QhcAy6aAeVNOiu3sUPOYguEYT3XtNR/wNI3fJ5
         Lokg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772738174; x=1773342974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T6mSzgIW84n78L1oui6Tey80VTrBXBQQ2EtxjS8uHis=;
        b=LWoHojmxsi7YTqvQK2vaamAX0sB/8BBIz7WrGtlzpr6cbyVd3FUifWEYFRuPOK+kJz
         AGoCzGwpyv6Cab/a+QswZVge4nemq0uy0Qc1hkW/iZJwLr8EOUY6kKvpBFS3pLgsxl0H
         S5+xerkaJtae3o3ClDlUWDX2tEqTJYCWHI0zljq0MMNi7Gfn2bEvd5sSkBHm+1Tx/mo4
         2WqIItSyqgT6GagK2h1GZ3wrkfF1LgovTNfjbhG7DKZqKwNEPaUHqzVXZqawQQR9QGuJ
         90P3EKgHT1HLmhYXyKVaimee4pPOIlkgA6H1WfmdAdhmJBf+J0X4cS3iN0xtcsXKvEjb
         Jtnw==
X-Forwarded-Encrypted: i=1; AJvYcCWgEeLjnAFA5IdNEf5T/XSbOtk4ys50fPvz8bvPoDm6VqN6l6NYhhKz5Ex59x7V5odLk2HAm8ifGv3MKUvN@vger.kernel.org
X-Gm-Message-State: AOJu0YyM/pK0GkJtIRrBa9hYFBbF2am+d/nFtQubNoAv1cZC2+/eTHzb
	T6WnS3hkYtFHNbgHwrsgpYuobtmAJtISEyCp3mfnvpv3sjxS+67Rj2rcIosgdmTxXmzQrgdrbYU
	AsL+o6qcd6ZRk4O+BRzeTNFjoan8hZeTHMysnBQR0yHojUSBJlg4hiIWnWzdiPCqyZGZsUOlHcu
	omGgfQKBkLNqkkscHNk3a3ASKJLpMyADigauD9T4q4H0Q=
X-Gm-Gg: ATEYQzwbmywPz1cnoi9A61NC5PaqRm4AZZpin1I9DROy25qFb9yKgYRf/w4j2Gdi499
	edijXfaEBQNQJsxVXhkec0KU2JATOdEExtw3nAwWkirFOiegDcHyUsI7uENxeTwLEpFkbH0zsVK
	Qt9TBF8/B7F0l4tJzBkNGF6XxION2lz9m8NLGJBscPzzSUGaNgXuYI0OFPClq3EtOZiBqV0fisZ
	VR3wCW0GW6MpW4Ov/w/PJPhZSNM9KhvUMfX5GRYS5S4z03A2bmboryX74dEDeIOZ8rh
X-Received: by 2002:a05:622a:1914:b0:4ed:6e70:1ac4 with SMTP id d75a77b69052e-508db35a31amr82530331cf.42.1772738173750;
        Thu, 05 Mar 2026 11:16:13 -0800 (PST)
X-Received: by 2002:a05:622a:1914:b0:4ed:6e70:1ac4 with SMTP id
 d75a77b69052e-508db35a31amr82530021cf.42.1772738173307; Thu, 05 Mar 2026
 11:16:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260305003253.1022386-1-kerigancreighton@gmail.com>
 <20260305003253.1022386-4-kerigancreighton@gmail.com> <dea45e4e-aebc-46e4-a245-3603da1779f3@oss.qualcomm.com>
 <CAN6+ztxfcNR8xR1qwgHQcHHM=zoQbMd-8oggb785ssPZ7f=y4w@mail.gmail.com>
In-Reply-To: <CAN6+ztxfcNR8xR1qwgHQcHHM=zoQbMd-8oggb785ssPZ7f=y4w@mail.gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 20:16:02 +0100
X-Gm-Features: AaiRm522mri_3_E_tLhvFR2PzRjD2c5pLyo0FI7lB2vgbC2_G-1Iu1ExQrqtndw
Message-ID: <CAFEp6-3JVicAVJB_+5ceSar2Jqstexo-0tyemg3C=qcznQsmxA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] wifi: wcn36xx: add support for WCN3610
To: Kerigan Creighton <kerigancreighton@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, wcn36xx@lists.infradead.org,
        andersson@kernel.org, mathieu.poirier@linaro.org,
        linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=a/I9NESF c=1 sm=1 tr=0 ts=69a9d67e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=pGLkceISAAAA:8 a=29fU08-qhLxzT5EMGmQA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: ce3VS-tMKlQfjqLZ81mV5UhcezfovWn3
X-Proofpoint-ORIG-GUID: ce3VS-tMKlQfjqLZ81mV5UhcezfovWn3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDE2MCBTYWx0ZWRfX59YaMY8UwlLF
 ppt4hCdQMPQi7nhoBUe4iGSaO4FUt00Dq/Cs1F8MoyOshyzdMh+Utb5H1gMeVngrn0AD8k4I3SR
 OAc9vtEfwIe0Q1tCoJ+XucYD+FtNB3JuRKfr+AEICO0M07QLRBWFmM1r/fYBKpKnNkWeHCGt1tu
 tI388PI4lgwlp+sLfJPKmoSYSyVku1apux1sRpAp2TmwufDcPj/XlH09B6yxWH3FD4QIpDqtLlv
 FHDqvz0ext5HIkmmfNr9LS3GS80GpUtPuSfqAKsjxBweE0diyYL442nWbVlWZ7ra5CBom7y3u6G
 XbylCk2tVdlNHisjqMNhyQI7k1E4F/qnOxc+2mS0fC1xoIoYKT5tP2/CgKouvPBs7J//gc7LJCR
 gtMynuaXcDD5PkTWgCetVaGGu1OrczamRKezBPMEtF2dBlANWYkR1GX34k7AhfR188UWZM5dYTB
 IktL1NpA/Lcf4zpIWRg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_05,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050160
X-Rspamd-Queue-Id: B974C217591
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95684-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Thu, Mar 5, 2026 at 4:51=E2=80=AFPM Kerigan Creighton
<kerigancreighton@gmail.com> wrote:
>
> [resending to the correct people]
>
> Some of it is observed behavior, some of it came from seeing what
> the downstream prima driver does.
>
> With the default configuration the WCN3610 shows extremely high
> packet loss (~95%). Setting ENABLE_DYNAMIC_RA_START_RATE=3D0
> (as done in the downstream prima driver) improves this significantly to
> around 5% packet loss.
>
> Further experimentation showed that configuring
> BTC_EXECUTION_MODE=3D2 eliminates the remaining packet loss.
> With the firmware default (BTC_EXECUTION_MODE=3D0) the chip emits
> BTC-related SMD events that the wcn36xx driver does not currently handle.
>
> BTC_EXECUTION_MODE=3D2 forces PTA_ONLY coexistence which avoids
> those events and results in stable operation. The downside is that this m=
ay
> increase power consumption because PA remains active.

Could you please add these details to the commit message?

Regards,
Loic

