Return-Path: <linux-arm-msm+bounces-102078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMccFz3F1GmmxAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 10:50:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B33AC3AB846
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 10:50:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BEDF43016CB0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 08:49:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D77939A81B;
	Tue,  7 Apr 2026 08:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MdbOLc5z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NfbKYmVv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3715039A079
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 08:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775551796; cv=pass; b=Hu6/l2+r4Y3PfwPYelosbzc1Pok3uPwn6AV5orLi9bySmMMHDjtNeBaH6qOhj7fkQdB82RcTJ4OLuiyfeqpWbr51tyTDz523L/K6EQZhKujMzCxg+YZPvKlesfedl3Hx88W6/uFdpEuVNwUXd5IB2q165/zCjPnxWyGifGZD00c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775551796; c=relaxed/simple;
	bh=w+LHVYfCEF6dTMGNg7i1pUqmoBnUbKwZAxxQ6dUcl2Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NcE/JljDLxt+pxbid+7CaRxbA95smLcSSodHgkOSeW1VxMa6AkHVPAO4hPQqtRMslb45bJEjFVzjwAZyesGXqBIVd1copHrE0YPDqDZ0jOA8LvR0QVfaqxvg2puzlwDCBASSGrmDWF+rqQY95sNvGTbaUqmndhsqBNMwFPBqvfQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MdbOLc5z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NfbKYmVv; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376Ypjb2327993
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 08:49:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w+LHVYfCEF6dTMGNg7i1pUqmoBnUbKwZAxxQ6dUcl2Q=; b=MdbOLc5zLAj19UPp
	m5kpftOJvLh9rjER9uhttYGUSnIEhaQtobEFF0qGCxJwYm+w20HSi8QP5Yj6Ctje
	OGBTLe38qT2e/iY4By/TCazeCne19HbVCRf/Fd6kAftoXVRzTkDiUYF+t85BiQER
	N+e3F3+ixjAYyffcgHUhQK5pIQh/Hd8IARgCO8yzG7qm8L0zq5SjcNN88uRt5IGd
	Zv98/k8mLaGsb/VbFhDJcq+3JiVgNaxsnh1+3OOyrt+5Nv0cZyHyxEUO3zY82wPZ
	/A6DDKxqf0hB/4TGtOzv1GctE1Jf+8z61iECz9cFdHV0Wak+15GQDbYc56yix85H
	1N/DRA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcms4sw6e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 08:49:51 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8a22dbeeb96so25909146d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 01:49:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775551790; cv=none;
        d=google.com; s=arc-20240605;
        b=VG/DMONvzyBWbKgoQNR8mUM874CjJSldOMgIk9cEGME6L2L18u7OYUUciRqOMzpeG9
         K7SY2IbRDqBp4v6oeJlrqBcsZNYDwnJBQ7A016HYboD72UdYmorpkeMOR8ZcZwuNqfY0
         LLFRoRpQ2HFdryypPqgPVSy2/UuDx0xUSGWQM4SryjfPJVkLcp8Xeoze9xIWwzL4f1La
         53J4xNQZwf+kkm1A5BA+bQ8ckGZ0lc+0nstHX4Y94x7uIiWztUDTCGGtRW7fo8LcQf4y
         rpUzij2K3CnXFsKtlZmbF6zAIVRawLuW+MMG3NnOxkRQAQLxercD1yvT6AU17X5KWYJK
         ksVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w+LHVYfCEF6dTMGNg7i1pUqmoBnUbKwZAxxQ6dUcl2Q=;
        fh=cRckD527peU+e5gv1gswTQ3Y22iN/Zlb8jrldM5/fKM=;
        b=ODTF447JYK3h3J6acktf02GcuwuBmBPwHP8S6PNVWy36D1mS18Er4OSWpzwvbteq3w
         +KqAQyfG2OflDCi8IKV9THSz4OPoP9YRmvlplVrpZAyl9OCPiWkncKu20pDnUqfma5qR
         teePCCMLUQOFCIUOCJzpkT9APxjM26e6gOaczjA3LrPYxVwNVmvpFTxYTLd/cGuAUhsh
         CNlYXgqz5dfZcqkkDLMPHbSYEZnUY/ep9L0bZ5/8nZfcmZdmTBaF/iw/z3238+GpZs+t
         N+ATdFWbF/VZdpGe5J059rt2IuEn9iNeQENZ3dK2nryErVm57eFJWaRsYFOqoRUVvQ5E
         ZnOA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775551790; x=1776156590; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w+LHVYfCEF6dTMGNg7i1pUqmoBnUbKwZAxxQ6dUcl2Q=;
        b=NfbKYmVvRJuzewRCssCYpA2v49NfT603B2hKb90+QuMTICVMEGgx1YJP2RO4I7bWnt
         76ckGDefQn4lLaR2IYSgf0o/bJZumt1tbTlNRLixM9wyRhp/0CRHWSNwmIkrrXarAfNP
         I2ckH0RfxkwEQAS0OXl/WETQNsMuuy0db+PZ/pMVv9AX1melYPmmnauud4Cx0ZJy1apY
         GeMvMFja7ekQmEeT1jezcvCPCvW4z/gJfk5yrHhUFEAbHYLUPK2UGdAsI4JIOlb+Y9ve
         8HekBZvRSYXypRNvaAs29fAT5HNt3r3DsoSbtFZkI9+rAHDSxLVrdZKjgCrV93vAe4T0
         IzSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775551790; x=1776156590;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w+LHVYfCEF6dTMGNg7i1pUqmoBnUbKwZAxxQ6dUcl2Q=;
        b=Zv/KVB6NU3Uv27RjJ4lzPPfiR/Mp9TJG+gktOifQYPLvH44UwHN9M3gCQWSrtJElOq
         aBbgBgf3hJ+FSjaPsKcnvJs3/lX+r542Bqf7Y65KuNUjvFQqSrx6Ju9xpfoTBVmq+JXt
         542T8tjG3J8JVEDmrRuUROiA1rHk3oGopZzsOkkzAoS9Pn+8dZg28RvYmcdxHn59VDdN
         H0dtkABD+diQgH7H76bi8XbVdZJL6iHh6zgkivqf2pGjXrRab6jg3Yuht0LnXnwzO0iN
         CHN/DoWx2X5LjprlyQSdp871mW8k1WDH9XeUynZX5ExQ/5ywqo1BAm8Pq/Hl26LMaUCz
         DWvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfokmwHT0HTPVoVmkhJkgPZn96AaeDyygWfCcnIZPIib4BQ1HHjmzIymWOAEeCPiIyauDcaUAfTOifxIV9@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+3phrMyy7tO4baFDIRQdH0t9U8T4Wokf5X3bpLQKpmUWgMUJy
	BKdlV6h7oMORPcR7BYMFYysq5KVy8iUGy1Ckzc1JUx0SIlKfcOBWmIj/Njj1ivM5JZXmcVxFRyS
	dC1vr9EcUh2BHQmfw43yfIffh8DwCDn3pdynl/nIWupixcbQpVIdaSyIreKDDAUSMzRydvAu7XM
	1BUlY6OxrlwTGwKRuJcq/xcBDmjSYX7T5JMhFoyBrjXEk=
X-Gm-Gg: AeBDieuqEUmFLTQy/YjZNH7RwJWOGMtKISnhC8YO5xL9jWNor2tR+tVXyrm7F0VK0bR
	G8dR1QSe6C38k/4a3IiaFzAPa+dTf4gb84tD3OW0/+6z4DIoRQ8PpqcJ+frOIiDFDT2C2r5tjUb
	MEp9yKbBqyWN8T6D3OFw5ufpH/N+8FWFv0JD3UbWOWhSwDH1yu4QeXfw2hfqGRa6EfHVBSLroWu
	yt/ZYQ9yDP/I2hH2DCisyyGgN9JzpCBA+NEIP4=
X-Received: by 2002:a05:6214:449e:b0:8a0:f8b7:3920 with SMTP id 6a1803df08f44-8a7042f9535mr250042796d6.42.1775551790324;
        Tue, 07 Apr 2026 01:49:50 -0700 (PDT)
X-Received: by 2002:a05:6214:449e:b0:8a0:f8b7:3920 with SMTP id
 6a1803df08f44-8a7042f9535mr250042566d6.42.1775551789922; Tue, 07 Apr 2026
 01:49:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260406-camss-rdi-fix-v1-0-d3f8b12473d0@kernel.org>
 <CAFEp6-2BMaT+u0cAJnZNCaxbiNGCayYs5uMr13AEe2iWWZZxzQ@mail.gmail.com> <5812c794-fd2c-4b49-8146-db6a1c783706@linaro.org>
In-Reply-To: <5812c794-fd2c-4b49-8146-db6a1c783706@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 10:49:38 +0200
X-Gm-Features: AQROBzCpWYOJa5sXQkGSrLbu31jfSpOfrZncCXLAJtn4ZOEzUaxAxKjCkAz4-nI
Message-ID: <CAFEp6-1HVph_+278jXCb-G-XDc=Bg1X0y9hSq79qr6WG+nJ3bQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] media: qcom: camss: Fix RDI streaming for various CSIDs
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: bod@kernel.org, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Gjorgji Rosikopulos <quic_grosikop@quicinc.com>,
        Milen Mitkov <quic_mmitkov@quicinc.com>,
        Depeng Shao <quic_depengs@quicinc.com>,
        Yongsheng Li <quic_yon@quicinc.com>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA4MCBTYWx0ZWRfX3GEN/XxO5RSY
 xoBF15bZ0xGg0hFffePpvvfDHkiTR+yJUce0emCxikr6MgFQPOyJ4/Do/9U1KPsa6/AXoJV4ouw
 IvD/LUTD3RN0O3GN8PbY1B8EUi3RW+o76bCkh258DYNxHGsmn4nHGv/gXFmFbkw9F8BGGonwd8f
 /Yech231+UOrLEiL4zUUasn83hgadlOTxXO/H7PVEbC1Oy2gQ/7zjLbmndzdqDFWpF1KwgQycPl
 wZpQ1iFEx0+aaXgZ2VxMBpLK/IqDk40uegFn1Hz28dnJtBZRy4O454WQ5MCGFRy+JAu4uoIDuoj
 h9ATqC+vNWnLbKGxoC2UzcZ3/jYprHIEUGBDJmZwPERRAmZW1JYFcAjMXVPRHky8VYiloeUv87O
 3YDQDXlFb1O0Gw/SeZfFopj9cuL48uCaw/r+df5fzQLBZHl6MAjogxZopBwrw5LP/W0jv4hljkp
 0lsw0JjIiBNHG9LJx1g==
X-Proofpoint-ORIG-GUID: ZBa2gpz865WAppVogIHqsoY4vi9c2vAG
X-Authority-Analysis: v=2.4 cv=WNZPmHsR c=1 sm=1 tr=0 ts=69d4c52f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=pT3TQp1K7lpw5WBvr8YA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ZBa2gpz865WAppVogIHqsoY4vi9c2vAG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070080
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102078-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,quicinc.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: B33AC3AB846
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 7, 2026 at 10:36=E2=80=AFAM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 07/04/2026 09:16, Loic Poulain wrote:
> > I agree with the observation and conclusion that proper PORT and VC
> > support is needed. However, as things stand today, this mechanism is
> > also a convenient API for leveraging different virtual channels.
> > Concretely, if you want to receive data from both VC0 and VC1, you can
> > simply use RDI0 and RDI1. Changing this behavior would effectively
> > break that usage model, leaving us only able to retrieve VC0 data,
> > which feels like a regression to me. The more compelling use case, in
> > my view, is the ability to stream different VCs in parallel, rather
> > than streaming VC0 multiple times?
> >
> > This then brings us to the Pix interface, where streaming something
> > like VC3 does not really make sense. In the current csid-340 series
> > [1], I therefore took a simpler approach/workaround of forcing the
> > main channel (VC0) for the Pix interface.
> >
> > [1]https://lore.kernel.org/linux-media/20260313131750.187518-4-
> > loic.poulain@oss.qualcomm.com
>
> I thought about that however, there are no upstream sensors driving more
> than once VC right now.
>
> So this really is a bugfix. You can even see it in the original commit
> message for this feature, imx412 was used in the example but imx412
> doesn't support multiple VCs.

Okay, then that does reduce the usefulness somewhat... Another point I
hadn=E2=80=99t initially considered is that we may also want to support
different data types on the same VC. For example, metadata, stats, and
image data could be transmitted over the same VC/stream? That seems
like a valid use case enabled by your fix, and it might be worth
explicitly mentioning it.

>
> This is a pure bugfix and now that you draw my attention to it, I think
> you should update your series.

Yes, I'll consider this in the next version.

Regards,
Loic

