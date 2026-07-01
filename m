Return-Path: <linux-arm-msm+bounces-115717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ffjqNSMfRWqH7QoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 16:07:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D942F6EE831
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 16:07:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=D0TYYJLh;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="J/Hzkdi7";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115717-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115717-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9C86F3150E09
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 13:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD82C492182;
	Wed,  1 Jul 2026 13:36:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0749248C3EF
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 13:36:05 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782912971; cv=pass; b=U0dIy8EjLpW3ZWubtmBpJ2KHdp3cauRvOzJ3BPHkH2kmVS4tBnxemwiUmHWcIiVtFiWy0Ppj5C6RLsC3bR4HbOkVGryV3B++eSWHHyF18IUtjjRYGHkLZjbVcHbsD6MdrJa140inJEoboofIlIx7x/pCnZv/T/6eXVc1qjT0i4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782912971; c=relaxed/simple;
	bh=N+n/R/mlFs2wkRiMkBtopMW3wGbtfZ47UIAhPinzCC0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gASQXJFR47wG9l6bpU5kS2OzPZR1jH+dc357KeEGCnZD2k8g430XoKBCzo92wAQu4wC85rG7A0oMN93lT/AIcMIoRgfogyooGKfDT4Q4kPvwCUDcZb+WyHZOs2tz7pniUduEs1iqb6R0KGFQQtEAGrJsizSJo9vqy4zKGMlZDo0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D0TYYJLh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J/Hzkdi7; arc=pass smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661AGehA794311
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 13:36:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ViDlik4RCW62sl/RLk3cKzJ5UtFbYqrOCQjRpG10ly0=; b=D0TYYJLhf1Zwu2jk
	spVTvuXD1DtrAeoeC2o9zHuxnGi5L2oNStqdVlMFzAka42qve3FCqsZ0imRiSjGS
	wY7ttgiTuQozDBsloMvMWMZ7rH/qOR9G1lDsmLiF7+3AQRgTZm29mCqmNwGw2zKN
	vUeqWlghwM2RkTREn3uRhASvg6bSZRMNTxyjChtRcJbcOyj43Bn47PrPRgooNtem
	izYRe/87MwRcAlgJr+M4KcqpvbGLoJprSrbUKhtWlVLLmIPX48qaTHAE596YlbJv
	Qs74Yv6HObEi99FocjmPI1rDGZPAdejjSZRzvLFUsQfNCiXq1CiD5iYcCYaKTrC8
	PAdhXw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f510agu77-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 13:36:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915f6ff639aso126209085a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 06:36:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782912964; cv=none;
        d=google.com; s=arc-20260327;
        b=Tvbd4KXzgxXTXwTpwT/N+2GyMPCsi7SSkTk3O+WFlAAWoU4zTMbLGlN6y4aL8HKGCv
         gwlnHSDwtGXbLgMCwhlsWcUoXmi1VIE/UQspjEmH8spKswdFbzIovpJHfX3rYXPDnxKJ
         3ji9bY4UWu65C1M5rR56nG4tKR8j9Sk2xAdMMLFlc3I5UvtwxNBQ3+yxA67IXXDwHxgW
         MKtr/jvvFiowfUfMSf1cn21ebyE+8q/thz+JC3iLOeu/vCwDgZpGXXjDeFEzFUmdPMPW
         5uHB5fkV+EQQ6uhUphpHemsbLPNmjRVb5OhdRRYeS9btmF+cVAafSz0qUv03nhpRLAEu
         Ix6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ViDlik4RCW62sl/RLk3cKzJ5UtFbYqrOCQjRpG10ly0=;
        fh=udvYyZ3RrI7FBh/6/cSvak+OqWR+jK/DohPvI5KeCkE=;
        b=Mf7//JCrLSoKHqNv0Fojt/AENxaP+zBOBLZZpXghlnd0clxNYf5KDUBO2yfjokiQuS
         0lErSHkDOJdNXoGOwhB1XNSP0ZSyhR/AZIi8jxQ+5ECa8HGT8qyJwr9jjRfDVdh294KU
         9pEg/f701pqJQBEjBjFYhhWnCe93Y6J+As0js6reFuW9irU9X8UWv4FBeiA7X1bdZ0Li
         7JM9gtDXsuKyBa4Q1Cru32SGMKOTtzqrm3nPHJJSWTVLYxmVUgin8tC6rWrQc0Ay37xa
         9JtpGhxKSJrIpi1p1DWTQbmygfeRCsVzPFZUOwyAXn5isHfXF5g+hCsVwLJua/j1GGUV
         uK4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782912964; x=1783517764; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ViDlik4RCW62sl/RLk3cKzJ5UtFbYqrOCQjRpG10ly0=;
        b=J/Hzkdi7UAfkvQ3JS+pBNsS3Qmx4/AV7Wjuw2Oh8ju62IMD4QCIsi8DVpTbiouooBM
         Rcm2GJbEmdUbxy+Tc3ChOTTQm7hJOvM938TBwM5bFgA4o2C2AO2+lMAO5TMybnLRSHmF
         QLShWKLlcjvI5yKmQ6Mwu4jxcPhKVXtkg+uo2PRdBGokaoUPmnFlQQW49W+GI91P/mM8
         737P8Heu+Qg3/8bZhhpaNqZxmFsxiIS3IqmrucpJR22QrEYxEOYX4bOgxfGLNUTycXxA
         1HWSCdbIzTxZKs7dwvsBdnBCIeB2WMujN8Wii1CvgsQCQmMwEdU3daGY5Pwffj5LsOHs
         hBgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782912964; x=1783517764;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ViDlik4RCW62sl/RLk3cKzJ5UtFbYqrOCQjRpG10ly0=;
        b=tH6Yk53gGL/9mnwTgQjOEgsAkvMxGcm7uo4kE/gjJZiJtWHYNEbRjGSwqsO08D+3RF
         Z9ZK3/1u29mYiP+uSL/YGcHHXhNx6oPf03YZl4sXBvODnJX/18e8Frmr6HI/7CYzeFtg
         tHBnxxshp1G/bHwhIA2DiBcFRkqg/D3nmh4oCDAoPkDgvHEaUah1n2lHV5U4tO7jMB2A
         u8uxdznZ9DNmxhVa0SElYPJJAyuwayYa334EgYl4uLA7NWivQ0Hu8N0vV9C3NWOAB3d2
         bVhophQn0Cz8yYFEgE425MKCa8BTZyJYGgnytEsec+JTdaDC5oTq3xWc3XhDuA+/Dax5
         L4oA==
X-Forwarded-Encrypted: i=1; AFNElJ90QnOXX3Oq0RVocWOvma47L6MjeVVD04/D5vs1eaxDCjz1rUQSrgz4Cm6whb1sV8u50hiLepeC3UN/X4Ri@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+l3OdZBDRwKJJl1MhQGgiMl5gyCEbGi5is3G8sxaKgvH1B1+l
	lAbPEp8gLYYNkpjU4HfdkW4bZft64FcBFGHDyX8LBrq2JnpHEo5t3lrFhISfmX/NT/Sq3CdugDv
	vwctpCNPYvTpvV8CCbMweAk4Bq7UM7VgDcZoLsso/y4I2LxW/UsVuiqlrYgM9BdBrE0qcfcJ+Vv
	RVqPjC/BXyA9PEzE4dcL8FokARMccTQo4sCjyd30ctVwI=
X-Gm-Gg: AfdE7ck5khvkuUe7GDXA10k1rpGhOAADx1VQ3GQde/edMT8db5/i8/fa94qs9J6/RMj
	iBKsMcPn9WWlp//yBfY8k1vqZOOoA25YlfZ0t4DUIsI23sKq9koErFhXkD6paqrjMqP9sb58i/p
	u9mWVV9IrLVZe5ReiD1U4Mmj0kLa1jRdYwKDiFYUTULfqRMEh8lPI4IlV4PqqkQcu3OL6ZM2aJt
	p8ikKsoswW8OUsVvfQcnB1TOAC1t98YXmtHMJZahe84ASd4lhaYoAQh0j+ecSqGUxWso+stXmv4
	1P4VtlY+lA==
X-Received: by 2002:a05:620a:28d3:b0:92b:6805:91be with SMTP id af79cd13be357-92e7853d109mr199307785a.70.1782912932535;
        Wed, 01 Jul 2026 06:35:32 -0700 (PDT)
X-Received: by 2002:a05:620a:28d3:b0:92b:6805:91be with SMTP id
 af79cd13be357-92e7853d109mr199161785a.70.1782912918609; Wed, 01 Jul 2026
 06:35:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629-block-as-nvmem-v6-0-f02513dcd46d@oss.qualcomm.com>
 <20260629-block-as-nvmem-v6-1-f02513dcd46d@oss.qualcomm.com>
 <20260630180219.GA4139943-robh@kernel.org> <CAFEp6-163adAq8-H_pCzGnq+Fo4jpyKGs6Jv25j3fSpZg3COjQ@mail.gmail.com>
 <CAL_JsqKFjk-mdaAAOzNB6rFiJbw5gd4eDpRBLQL-4q+uJKnp3g@mail.gmail.com>
In-Reply-To: <CAL_JsqKFjk-mdaAAOzNB6rFiJbw5gd4eDpRBLQL-4q+uJKnp3g@mail.gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 15:35:07 +0200
X-Gm-Features: AVVi8CfNT2AJJTgPBXfFVJQmZjW_-a9Isbc3rycVEtJcwbZkpqGBU1gJZohgDaU
Message-ID: <CAFEp6-20FXTOKQ6EPuR8OUDkqE4JXcUbXaFy7kRFt4fzszPQCA@mail.gmail.com>
Subject: Re: [PATCH v6 1/9] block: partitions: of: Skip child nodes without
 reg property
To: Rob Herring <robh@kernel.org>
Cc: Ulf Hansson <ulfh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-block@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
        daniel@makrotopia.org, stable@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 3u9vp3Ahq_dX6XfLOxFVAxeKRAI5X66Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE0MiBTYWx0ZWRfXxORhMUzGoK1+
 t9Xm6EQqvOc2clS5pV40NzZElJDOKlgXwZmlnRUb43rD/TYDAWGOHNt7ia6/5g/SV0r+nhMDgGN
 bQ9Bwtqg8ZinJLSYfFPAFSwZ5+kTxARlDhB3gR9feqe2mlZ6xHwfKkC0S2JhnvNuBcKqbFHQHX6
 YGozg7VJvcp7z9ddEm1Z9qDlv31VyFZ7YUx5mAHOWkCNcyfCoqoTmQXfdEsAMrAL5/6Xr2FsIs/
 HgDPHS0DkH8DF7jHkVzyAWi7MhZOQsxs55oqsQqWA9JjZmjAN4f3TyNQI7eBA0LuONKsz5irADr
 +udujgAZhR76IQ8ZuWyaTccOAhM4Qm2/McTLD4GSEJrCcc47omECjOPf97+K5pKRsdkEys4BmLx
 qxl5xosjAhT4F4NpdnTRruX9BZJqyXTMiWP2R9dc+Z2q0fzPC8gbbB2/XTLN7c0swMQLC3VgXql
 SqsPaaz/aumD/WZi3WA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE0MiBTYWx0ZWRfX8l/8PkI6N7t7
 +T8o1HDuE/Qo6NaUMpFwgnYEB13VPpsZ1x9upEXxKWMCeOXIkPJ+dUQ+uxv5ZskJnMRo1R9/lQX
 NrymybLKOCYXaz0zQrBE8wXTIijVOdU=
X-Authority-Analysis: v=2.4 cv=JpXBas4C c=1 sm=1 tr=0 ts=6a4517c5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=bM2Xkg4KEcMkddnjsM8A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 3u9vp3Ahq_dX6XfLOxFVAxeKRAI5X66Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010142
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[37];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115717-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:ulfh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:axboe@kernel.dk,m:johannes@sipsolutions.net,m:jjohnson@kernel.org,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_bgodavar@quicinc.com,m:quic_rjliao@quicinc.com,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:horms@kernel.org,m:srini@kernel.org,m:andrew@lunn.ch,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:saravanak@kernel.org,m:ansuelsmth@gmail.com,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-block@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:ath10k@lists.infradead.org,m:linux-bluetooth@vger.kernel.org,m:netdev@vger.kernel.org,m:daniel@makrotopia.org,m:stable@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:luizdentz@gmail.com,s:lists@lfdr.
 de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,kernel.dk,sipsolutions.net,holtmann.org,gmail.com,quicinc.com,davemloft.net,google.com,redhat.com,lunn.ch,armlinux.org.uk,vger.kernel.org,lists.infradead.org,makrotopia.org,oss.qualcomm.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D942F6EE831

On Tue, Jun 30, 2026 at 11:46=E2=80=AFPM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Tue, Jun 30, 2026 at 2:59=E2=80=AFPM Loic Poulain
> <loic.poulain@oss.qualcomm.com> wrote:
> >
> > Hi Rob,
> >
> > On Tue, Jun 30, 2026 at 8:02=E2=80=AFPM Rob Herring <robh@kernel.org> w=
rote:
> > >
> > > On Mon, Jun 29, 2026 at 10:55:20AM +0200, Loic Poulain wrote:
> > > > Child nodes of a fixed-partitions node are not necessarily partitio=
n
> > > > entries, for example an nvmem-layout node has no reg property. The
> > > > current code passes a NULL reg pointer and uninitialized len to the
> > > > length check, which can result in a kernel panic or silent failure =
to
> > > > register any partitions.
> > >
> > > That does not sound right to me. A fixed-partitions node should only =
be
> > > defining partitions with address ranges. I would expect a partition n=
ode
> > > could be nvmem-layout, but not the whole address range. If you wanted
> > > the latter, then just do:
> > >
> > > partitions {
> > >   ...
> > > };
> > >
> > > nvmem-layout {
> > >   ...
> > > };
> >
> > In our case, the nvmem-layout needs to be associated with a specific
> > eMMC hardware partition, nvmem cells can be a simple sub-range within
> > the global eMMC, each hardware partition (boot0, boot1, user...)
> > having its own address spaces.
> >
> > That said, your point about not abusing fixed-partitions is valid. I
> > initially dropped the compatible =3D "fixed-partitions" from the
> > partitions-boot1 node when it only carries an nvmem-layout and no
> > actual partition entries, making it a plain named container node. But
> > it's a bit fragile if we want to support both nvmem-layout and
> > fixed-partitions.
> >
> > Regarding your expectation of a partition node being a nvmem-layout,
> > do you mean that the nvmem-layout should live under a fixed-partitions
> > node? Something along these lines:
> >
> > partitions-boot1 {
> >       compatible =3D "fixed-partitions";
> >       #address-cells =3D <1>;
> >       #size-cells =3D <1>;
> >
> >       nvmem@4400 {
>
> partition@4400
>
> >           reg =3D <0x4400 0x1000>;
> >
> >           nvmem-layout {
> >               compatible =3D "fixed-layout";
> >               #address-cells =3D <1>;
> >               #size-cells =3D <1>;
> >
> >               wifi_mac_addr: mac-addr@0 {
> >                   compatible =3D "mac-base";
> >                   reg =3D <0x0 0x6>;
> >                   #nvmem-cell-cells =3D <1>;
> >               };
> >       [...]
>
> Either this or replacing "fixed-partitions" with "fixed-layout" if you
> want to make the whole boot1 partition nvmem-layout looks like the
> right way to me.

Well, now I think both approaches make sense. We should support a
fixed-layout on the entire hw-part/block, while also allowing it
within individual logical partitions.
Support for the former would only require a small rework/addition in
this series (to have the hw boot partition a fixed-layout) . The
latter could come in a follow-up series, as it would require some
additional fwnode logic.

>
> > That makes some sense, this would require extra work for the
> > emmc/block layer to also associate fwnodes with logical partitions,
> > not just the whole disk/hw (hw part), Is that the direction you'd like
> > us to go?
>
> Yes.
>
> > Also, Note that regardless of which approach we settle on, this
> > specific fix/patch remains necessary to validate the partition node
> > and prevent NULL-deref.
>
> Fair enough, though the reasoning for it would be different and
> perhaps should give a warning.

Sure.

Thanks,
Loic

