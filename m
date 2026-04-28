Return-Path: <linux-arm-msm+bounces-104967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GELzGxmc8Gl3WAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 13:38:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 12379483F7A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 13:38:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C11A530425F4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 11:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 514693D6CD8;
	Tue, 28 Apr 2026 11:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nidgTwLw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kON0cKc3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78A63B2FDB
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 11:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777375798; cv=pass; b=lzExb90eAe+4MOTdiTHAaYZx5VhhWTI65PW6m2saF3pMvZhT1K2QrfUTVJLv8slaMQFmV5xqVmhnYiDavD52dhdtijozPhi9J0+zMwL6/k6WkzLbXRUVaF/gLVazny32kihyeu7kZE2kfyMKuKanqiSGZfwXebv9R7fzVGvi7fg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777375798; c=relaxed/simple;
	bh=gAOBAXwoIZgNjfV46XOLVfiLxyQWHRJZDpDieg00AOo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bPUz0uC225Djw2r5MF4l2xNDtw3Q6dZNDkSFPNrggrtUnbQEZSMa3vA6kNl3aOdeVfKtO/ptStOXqzk1M8lawgTBICi3pt+kjzO8irMGgr1U+inHRz1CUbRX9LY9WhLUXBPXWnjfUjtCfi3skQlp5mkD1OzP9lUG1vSnOvJsCPY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nidgTwLw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kON0cKc3; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SACajD2112521
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 11:29:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0hbXvdArmq7BM5rLKvOa8BUlGtAkO648SmKUpum84i0=; b=nidgTwLwOByEgLG1
	y9Txngz3OgjJ0joyQ5rcFFtKfd3GKGy+sITAj1oc8zv7FmS4Ru/PnACzKjMUpnNu
	w3HaqUHSmchzsNTpfll5aHGujziIkX0sbJ6I5bwMNsOc12b0tppaHztpb5Igfhii
	xAA9zFE2pea+weLDGr3rI+uroTC4Dh9Fizbsd76/mGcvjz3+RYa2WRnzxqwSZlY4
	wf2glIzspayJhRBZZWtbHJeIp66dqEe9MU9B6LUzJN3AwDj+W+n0SzfvXo5ru/X+
	lVP14UoBzpQcKNEJF7+U0oDAI/cgprHR4XaUQYazI9KUVFK/AvcwL6EoQhv/aGIz
	XOgnGw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtdmbk950-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 11:29:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50e136aff17so205767281cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 04:29:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777375795; cv=none;
        d=google.com; s=arc-20240605;
        b=MNYpjnIk/VX29zzr0wHxztDoqPV92u/BrnguBw6gKvhkEXlraKGTtAS7N5/CD48Tpz
         eSNAZxalx/7AW92xY+Dd0L58M5/AAV9SjrELpbNKbUa5ssrP2hruAxO4PyrnpYqEMKB7
         8ObT89XWOq/ekMiF2FyIkhShL5wChKsD/8HYUo9R558HdqBMwh7+PP+0Rir9FDDDL5fY
         FzpBEKwO3cTPF+3zEON0wy0DAMwix+SxkUKPDRYnU14mqB7Ebie8uh6rArB3K6IemE41
         sxGXEgZSp76aWpHJQw691QQGYgFoXBAcEGRoaSPb4gJNvxG663yBTwhRFt+CoZ4YMLJP
         y/NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0hbXvdArmq7BM5rLKvOa8BUlGtAkO648SmKUpum84i0=;
        fh=hpwtCEXRdZEMbYuyhsIeGUjG3xDouoo1jjM66iPSGuM=;
        b=JgyQQnsgRU43kIz4KzgVh10+FDGOJv2dPyqRaoOEzORANGwqjxtzF4xjXJGRFgVWf0
         x/DgJR3b5HBtRfaBuhz/aWRIG2j+ZP6Q8R98oI8UqTn26HFxoAPXKxB7Q1s0NAo/9Ui+
         Bah278faV24NAuevZFc8H1cOjcjSPhVDl9TxXJIHer5vSOtGj/peGclM4+UeUuaelOcc
         E0AhLJUqrBwGewcc5wi1D8uUW058G7q8NEvijxUq+WPag0AQ1Z32tNvkfcv65P0W0GZB
         5CNJLomc9NzVZiZiczt6swOqOIGmU4EzFLAI/Cy6J1gWiR/wHoTaLC6NZxBcgNuGFSCm
         d8IQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777375795; x=1777980595; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0hbXvdArmq7BM5rLKvOa8BUlGtAkO648SmKUpum84i0=;
        b=kON0cKc346i3f/W7/9eZUusBzMR5MIc1pDqusZmRkHAy/K+eb2XbLpWqXtjEZFHaT7
         1oX7GMqrWFWyOMtq0eDKxLc0/V3FB/1DaTp/tM44XEaKAUHuzi5tefVRj6xYk+utZHAB
         fGAjmaW1wP7aKEAXRZefCIQlPi6g7H/aV7Pif49cyOwTiOQYCaldSz8qnoTm3TXeU51F
         SC27CzMzG3pZ1mL1d2JNJHipLZoqP5OiqrCjXA5MnZ/DbFDXX4WUaxsXLRAOBcTqLOqq
         kQWYfmLybkXP4nGj3X4nS6qBQHsOI3C+yMQUDjfBxVTcmOAExNid9HeGPNBbtenno55s
         A4gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777375795; x=1777980595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0hbXvdArmq7BM5rLKvOa8BUlGtAkO648SmKUpum84i0=;
        b=GB7Zd+5XPkVr+bmkH0koBCaDhxfIJJhu687tpBcaULFTYswcKYW2Zfud/ZWC5nh4Yv
         ovK9x0ZTgOqZqxKg5SoYGOhBu0Vde6Mde4VdARoq9KOtOg122jjbPNH+P5WEkB2T3tDz
         LDAdF8LhRbIZJEAhrp2s3E6yACHv9hTR62poSsybx6BWaApFOAaJUuR5Dfz19AVD5J1X
         Xsu2ZHOrNY2eImoRTQQP93z/OvkHu/N+tQr6gXkiplPp36TxJpJAojid0WmilxrX/xi2
         6zt8k23G0QQBpaZ0/3L4/VDQ5jo9KjW7LqhVGwUdniOJJFg7QwfboO0S1Oq+ADpBSaAA
         W8BQ==
X-Forwarded-Encrypted: i=1; AFNElJ8E5p19aaBCfPcQfiHdEl3IjSEIdn3GugO3dCpfg0A/p3Ql644WUZGOP2Kkf4MCUObBqkv9KKSYiF5kimoL@vger.kernel.org
X-Gm-Message-State: AOJu0YyzTHpJ1fIIREe9w0Ovz1WE+45tc53AFfBGPYNs+5U5ZXHeW+nN
	O7A84ofzDvXhRrA55M8JZqyOedz8juyWytxZohJNYcR47Y2eBjmn+2nm+/TiU1FAcnt6jj9bOXe
	p10AWmSl+EuAS1pYBFVzYqXud4aZr3MWTOI1TLxRDTU9Y+xgqt/biIBmYpq7fEpQcMhrsdeFLdt
	4zXaavDMifoCUxsWMYd9B1iPJn7qtbK0I/6X0Vc3QF7Ko=
X-Gm-Gg: AeBDievZfQloV9W1M5dXkqCv2DRe2b0ZB9GpuILnGtaJ7unRrCnltxcDSeibsD+S5rU
	IK8xvwReXpittyFW1Y0GkAX/ahGqi6jDfMq8UVsIXtJNl/a8noPxOEAP+eNsu9jSUfCNFhtnvQ9
	Hr6wrj2oXHfaXbDKmm0Ca6pF5ZofkcovXrAunKuMuEy6INQzjNj8Gel6rxiS0JNR1s9qCAha/oO
	lUpTVkwm3/YP7O/TraJWF4n0uuR0gV98gR5+bBw5nU2t35GWg==
X-Received: by 2002:ac8:7e8a:0:b0:50f:135e:d68 with SMTP id d75a77b69052e-5100e1fdbebmr31893261cf.58.1777375794789;
        Tue, 28 Apr 2026 04:29:54 -0700 (PDT)
X-Received: by 2002:ac8:7e8a:0:b0:50f:135e:d68 with SMTP id
 d75a77b69052e-5100e1fdbebmr31892841cf.58.1777375794214; Tue, 28 Apr 2026
 04:29:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
 <Ptwba7JmobZufdkgayhAhPOOjZhv-yUkZSIMcQYJbKrrBFOdsdG_QI2uUof0EibbexBxSGC4drfA8J1zV2zDRQ==@protonmail.internalid>
 <20260427-camss-isp-ope-v2-5-f430e7485009@oss.qualcomm.com> <d4f786a9-3cd0-40ec-b499-8185e867af44@kernel.org>
In-Reply-To: <d4f786a9-3cd0-40ec-b499-8185e867af44@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 13:29:42 +0200
X-Gm-Features: AVHnY4IR6P3xmdEgm4g7wjJg0q93e62a-0qdxzDCaWk2GqaeMpyePeTLoKno4rQ
Message-ID: <CAFEp6-2RxaL4QgdBk4jrX3iC8mE8u6PvP89CD34x+Y4oAcwFdg@mail.gmail.com>
Subject: Re: [PATCH v2 05/14] media: qcom: camss: Add camss-isp-bufq helper
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, devicetree@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: TmWDDXiOpKJfpFkRXDVr99xe0LgCoOaY
X-Authority-Analysis: v=2.4 cv=PcrPQChd c=1 sm=1 tr=0 ts=69f09a34 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=XvfFUYa5IQhs_SHw49QA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: TmWDDXiOpKJfpFkRXDVr99xe0LgCoOaY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEwMyBTYWx0ZWRfX3ueH9YLidAHD
 +m+OrhwAU0kVdoT1nWizuq56v69qCyunMuEcoWDaqkC+wvcndTL1HMU+9gQ+/knzhczBf4g2F6Q
 1MW9UFu6zVA50Xc91TpPGZp08ifTuGZrHyGegMlTr7fWmbm3uuh1RDhdqNdQn4zfyOf1Ycg7JD9
 IvWQPJGnJxbbBPoYKC8J494e+qHPeGhM6Hx9briGp+3EfNXPORbBPdY3FHYD8QTAgWnRwqr3lmw
 yq7oJd06H8TXlFEFZQBUkLd33WWj4FEZsaIeYu2UlI8grlWL/+ncpbbisrHwbE5ipno/MdT2OVB
 a+aRY299AMPH4CuI0CIqasYhlhU8Uy0jTJHtbzpSn8XsiZ8bJdAWw1ZxvDWAKPJFmmGdJHxduG5
 ZSGcJMdviZXJsmpO3De+cFoOhPpXYtkriA3mDz51+s6L9h7vdXwvMjTxK/RjiukNJUWJP4rieGN
 CcAnz89wUJHXR9L5v3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280103
X-Rspamd-Queue-Id: 12379483F7A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104967-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

On Tue, Apr 28, 2026 at 8:56=E2=80=AFAM Bryan O'Donoghue <bod@kernel.org> w=
rote:
>
> On 27/04/2026 13:43, Loic Poulain wrote:
> > Add a per-queue ready-buffer FIFO helper for CAMSS offline ISP drivers.
> > camss_isp_bufq provides N spinlock-protected FIFO lists of ready vb2
> > buffers, one per queue index. This can help multi-queues management
> > and synchronization in ISP context.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >   drivers/media/platform/qcom/camss/Kconfig          |  14 +++
> >   drivers/media/platform/qcom/camss/Makefile         |   5 +
> >   drivers/media/platform/qcom/camss/camss-isp-bufq.c | 101 ++++++++++++=
+++++++++
> >   drivers/media/platform/qcom/camss/camss-isp-bufq.h |  85 ++++++++++++=
+++++
> What is the purpose of this and the next three patches - why not just do
> it inside the OPE ?

The goal is to improve reusability and avoid an complicated/large OPE
driver by moving non=E2=80=91OPE=E2=80=91specific logic out of the driver. =
This would
allow it to serve as a common framework for both offline and inline
CAMSS processing engines. Looking further ahead, some parts could be
further generalized or refined to fit within the v4l2=E2=80=91isp framework=
,
although that is a longer=E2=80=91term discussion.

For now, since OPE is the only consumer, and to keep related logic
localized within its respective files, should these components
initially be built as part of the OPE module? They can then be moved
out later if and when additional users appear.

Regards,
Loic

