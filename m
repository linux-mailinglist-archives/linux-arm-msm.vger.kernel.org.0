Return-Path: <linux-arm-msm+bounces-106114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHRZNeI5+2nUXwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 14:53:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 475714DA8F2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 14:53:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13FCC303EF7E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 12:50:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD9FD34FF4F;
	Wed,  6 May 2026 12:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cpasl/dB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iK0OJn8r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516613F0AA0
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 12:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778071816; cv=pass; b=W5jtYvA6jGdHTMd3dpL3h7nXJN/xZdf8ICL8Rltp0ONR2ktywC1blJWFvD24UDD3TH8Nh9ZUKfxn8xl64gr/7WzC8cCjui1GXAla5UgrtDbkCNem0LQD+W19cmJ3TwEjjSJ+9BB3hCwSoE4uxjOEfoQWg+9wqfQXIO+1p7Il0cI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778071816; c=relaxed/simple;
	bh=mS8r+S9pwmLKoRAaHK8MS4UWAwbGG4zgoB2kyfgCpJQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j262B+Q9usj+UFt0C+EU0u/TSN/MHw7K5tIIutlnFM305yuwjpPZlxs5kfq4UPfjT5RQm6KB+r2AYz3VG8jgHi4fn0wO28u2Jrf0ZSuMlNTCKO+olx85PxshPnwz9BTrj8bzSviZdalOxwj0/pnQGp+6ZHr7ikNtOsx6Z8GVZ00=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cpasl/dB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iK0OJn8r; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6467CZtc1527753
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 May 2026 12:50:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pr1pche33PBNlzUR0xWQRPtHTU8BxUSRKmofmRzZmZw=; b=Cpasl/dB+mNRW3GP
	peHL08s4IXVWZLRtwIT2Ruw9Tn4FICbvHwetrFzDhPd+NtkrFvlaO1CPiw8awhZz
	JnEck7fEUyJzO4xzTVNHkQmwZA+eR15fBJeCbL88qeZxxpkjOGEMCNj8Klc2OfzB
	LuA6RfyRgePGUARUhk8DsumoFtJFfek4l5X77T91mYh7l24DPpU0xx5kV0JX7Ccc
	5ctM8r949dYlO3xqLGsbTEWLaglEEyNSs0HFE1jo4X10pO5SZDCPRYA725dGNH5W
	80dCj+i+dV6wgXvZzvh9mRxYMe8p9KwpdENOqsfb09exq9LDFF99n0qJTrkduEnN
	qXVtDw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e012898b9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 12:50:14 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8aca172588cso158277366d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 05:50:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778071814; cv=none;
        d=google.com; s=arc-20240605;
        b=AflLZ1kUJ7bgrps4+uA5sZoF/VMD8uJZaOBw7kOsWFiZB9GNwruJXAIS6xcq2sTCQh
         zSaZNnfjKudAGOXCC2QN4mlKSQ/kKxKcEHk5NJNtyn8b8ImiPy4lb9gG+5elad+8WF0F
         4tYuMZUl60eskogHsW+QxzdfsbOuOXqW3j1tYpluyN9bAea6G179tzNnlg88l+oBUpq3
         ltYz1x0FLbTstOMosRgh4E+UaP7OBJ1+u7QF2JyrG8f31wUZbfIzDd5Ia0g2KNoURAi8
         bfrPHQGZaXQUH/lxHcGWylQLzcpTCF9qAFESkexDA7XwUwocmwI+1P28edNsAg6/I+fI
         xQgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pr1pche33PBNlzUR0xWQRPtHTU8BxUSRKmofmRzZmZw=;
        fh=PW0eMADKrT6ZmIF8nClMHqmkT5vAHuJgg3J5OaTdQg4=;
        b=Qi/yOc6u9oMFfoMKbz1es6iIXzgmYRJZV4PtCs0uXf2sdz/+xMUaxEMiD1s/AhVrrf
         HipixPZ/49j7bh0LCIPRBGFImvIW99Iq74wpLTtQV/8gQPGk2Nq4Xl8Al86s9v5EDJL1
         F3R0qLo+iejxwCRClqRMXTbFAo2CmcgmEc8iWyQ/r1BBRi6uyXyQLZKPuvKZIWANkwcn
         fwrpt0IaC9LC/qtO96HnLTel2DoFeAiQE/4Mhstz0ZG9H3SZdjkUJgJmMTyV86DzoikW
         QU2r/2rY7yeCBibF75IcdONkHAw94TadVp2Qm8oov5lyGiUrX0ZF8MT/b+MBFNrylppQ
         3jig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778071814; x=1778676614; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pr1pche33PBNlzUR0xWQRPtHTU8BxUSRKmofmRzZmZw=;
        b=iK0OJn8rkdb+no76HC6aUCrBVkvjmG0b7RrlnDKD16txkfQaXCxWADxBZB7GPBdY0o
         mkySpyx7gI4lJA8CjXairPbH+q2QNDZnzv5IUU0hbUSAz1o6FIV6zPexzxJ9GwTnFdCg
         xUawNxz6wnKoUg+j5yRVrrSAC3Tokz30PbYJS0/n+Yo7M53tZXb6vdfxHIXK0B6OwkNo
         bXt91GY2Uh4//7Fm49C6lfUu3Id4juC/e9xw9GzkCqJtvmvBUaTYgQjIqAfNN5GHWhZt
         I1qeuR5gzFQl4GJB2Cl7/JX+eJVULJ8trVg3U6qOCA/Z2NYVwMEsw0t5oyudU4H0pd3J
         /l0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778071814; x=1778676614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pr1pche33PBNlzUR0xWQRPtHTU8BxUSRKmofmRzZmZw=;
        b=BUXNT++pMsBWpZnylUy5aMt/ChEr7M0T/qvWdvsy/BiDjE9/daZr/sRo1IbIt46w6u
         pVMrYbSpngL6BOSNs42CEQb8ptHDvRpAisE54DKsbTVZgWGKsSv8T4gU4MPvHT+Zok5I
         OyWI3fZh3d44j0IYCown2mMIGEaPusOiDsFrnXoCO37lPd9U1LQsuUnLNpmSsAR9M2xu
         2KaN1DGrNTlpb+NAm3iy+dPwFLbjm6LoHVcKVVNu+GswowrY14PZ3dA1sHl35keFn24c
         5khjU9JuCU0jiJgD9pfFPH9GNWrZyYW2UiNC2air+kELVQDFh2DFIX3Nl8jw+l9b6QZB
         8hgQ==
X-Forwarded-Encrypted: i=1; AFNElJ9sSU2CC14zy3okE0bBK1fkqyZkOBAfM808MsLikJRDvLsIhBdY139q0kG4gsY4fdorz/ND3R4oTLT/dPSG@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9LhP84tv0FLOp12NRzmcfL1bunaaSAMYf0FspiRXfvW19q3hb
	NnuJwBEWCZ9GYQSi09IDJSWbsFMu/zRds5tTycX9Etr+9tIG3AJpqRBCz3HSTAFASuFCIabSfb5
	v3l3MoG/iPf/XZOfjZQaT8N14JUgJRvWIm7Lx2CmYUl6kNzpcdzUPz3M+/0esBmWt/oQfpgrR+/
	TTYYPiALcZ98ql7R+gUkB6OJhXcTLZw/f4WQ6BbVbv1T4=
X-Gm-Gg: AeBDiesD1spRD03Xvw4l2LEVdUYRGTNRyocKhg2SA2eriD+uvqA6iqhtAp8HC9vIvrq
	5DVe1N6djnAWekP2uuo2rc9CfU4iL2lCwz0z0TVlxbVniIluE8TB6qPtUlXSpkMw4E87/w7/5aD
	ASv4/RUmWa5znJYvXs2Hv2wN38pUPe89uuaCtGTWvpUU1lGWh59+kciNDesnmAUpWN8c6KY6UU9
	MnI+OnPS0wU9DUGC6N7IdOXHuqWgHv3e3zA8Ll3nD/TJyUZDIs=
X-Received: by 2002:a05:6214:4589:b0:8a5:104b:e385 with SMTP id 6a1803df08f44-8bc45e1f618mr42954396d6.35.1778071813681;
        Wed, 06 May 2026 05:50:13 -0700 (PDT)
X-Received: by 2002:a05:6214:4589:b0:8a5:104b:e385 with SMTP id
 6a1803df08f44-8bc45e1f618mr42953566d6.35.1778071813020; Wed, 06 May 2026
 05:50:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
 <20260427-camss-isp-ope-v2-2-f430e7485009@oss.qualcomm.com> <c145efc2-9285-4e2f-a9e9-73c4faadf15e@oss.qualcomm.com>
In-Reply-To: <c145efc2-9285-4e2f-a9e9-73c4faadf15e@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 6 May 2026 14:50:01 +0200
X-Gm-Features: AVHnY4KyfxMt2VrjFb0bRHruVPCpaFG41raMk7S3fQl6jlpOP3lRjD4NH7eqmGU
Message-ID: <CAFEp6-2pASEmD1CrOpY6BpUHVLWgtPuGRsMYHFZ-GgUKy9EXaw@mail.gmail.com>
Subject: Re: [PATCH v2 02/14] media: qcom: camss: Add PM clock support and
 integrate with runtime PM
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "Bryan O'Donoghue" <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, devicetree@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: DIY8mTuhbu86IGCCWjxlxUNej3Coju01
X-Proofpoint-ORIG-GUID: DIY8mTuhbu86IGCCWjxlxUNej3Coju01
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDEyNSBTYWx0ZWRfX4ziCRuVf8AJ2
 430OrDm2K5whl9S14IE9goVw31Mv/eQczFk1ndNqwAdmWd5GEZGupS+tOsVtn+DFXNCrqleMmYM
 OrwdUvGYBvrO8wAXNyGIdkWmSWVWfWyZUPgO7lqYcoiZxjoKncMUhzLIUrctgCzE1g62q4I3hhn
 4exYJi9Vi0BBAhlF0itpv5EcI0ubOl+vVWS6rcHwWiUTQiLJYHIiZ6rsZkzIuSVQ0XIsqp8+EKB
 Tbak2OCnsjTF0qwsECyqfHYy9iCWlWGdNaz7mh6xiSBOBGGlDLaDHPC+sPCaWXcpAkniOGKCqlg
 tQdDvG7aPguADMt2It8oNToQCqvQoTwqdlWNkdXafCLbuPMzco9TcdNg4aqhyqPZUTuN3FlG18V
 MaDLc9n4H3VNP6oo1xeGh5ZBXKtT5UiU2spvUnUtOmEBY+3TkwPNp1dD57WsaQ4+miSfUzVjw3e
 8HPHi1AcpGN6OL1UrcA==
X-Authority-Analysis: v=2.4 cv=A8xc+aWG c=1 sm=1 tr=0 ts=69fb3906 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=ZQv5F3SHT4vI6nyy_eUA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060125
X-Rspamd-Queue-Id: 475714DA8F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106114-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Mon, Apr 27, 2026 at 4:04=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 4/27/26 2:43 PM, Loic Poulain wrote:
> > Add optional PM clock support to the CAMSS driver using the PM clock
> > framework. This allows CAMSS clocks to be registered once and
> > automatically managed during runtime suspend and resume.
> >
> > This is especially useful for global CAMSS clocks that are shared acros=
s
> > multiple CAMSS subnodes. Now that CAMSS is modeled as a simple-bus,
> > these clocks are automatically enabled whenever a child node becomes
> > active.
> >
> > This avoids the need for each subdevice to reference and manage the
> > shared clocks individually. A typical example is the set of clocks in
> > the top_group, which may be used by CSID, PHY, CCI, OPE, and other
> > CAMSS blocks.
> >
> > Introduce a small PM clock descriptor table in the CAMSS resources
> > structure to describe clocks and their optional rates. Initialize
> > these clocks at probe time and delegate clock ownership to the PM
> > core.
> >
> > Hook PM clock handling into the runtime PM callbacks to ensure clocks
> > are properly suspended and resumed alongside power domains and ICC
> > paths.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
>
> [...]
>
> > +     for (i =3D 0; i < CAMSS_RES_MAX && camss->res->pm_clks[i].name; i=
++) {
> > +             const struct camss_pm_clk *entry =3D &camss->res->pm_clks=
[i];
> > +             struct clk *clk;
> > +
> > +             clk =3D clk_get(dev, entry->name);
> > +             if (IS_ERR(clk)) {
> > +                     dev_warn(dev, "failed to get pm_clk %s: %pe\n",
> > +                              entry->name, clk);
> > +                     continue;
> > +             }
> > +
> > +             if (entry->rate) {
> > +                     ret =3D clk_set_rate(clk, entry->rate);
> > +                     if (ret)
> > +                             dev_warn(dev, "failed to set rate for pm_=
clk %s: %d\n",
> > +                                      entry->name, ret);
> > +             }
>
> So this makes a couple fragile assumptions:
>
> * there's only one "on/operational" rate
> * no OPP votes
>
> I would imagine that in the camss-is-the-bus model, the top-level
> device would house an OPP table.. but we have two somewhat independent
> clocks that may possibly have separate RPMH requirements for their M/N
> number of rates, which could result in M*N-long opp table

I think we can remove the clock configuration here and handle it
properly in a dedicated place once we have a strong plan.
For now, I guess we can simply rely on assigned-clock-rates in the DTS
to set a sensible default (nominal) frequency.

Regards,
Loic

