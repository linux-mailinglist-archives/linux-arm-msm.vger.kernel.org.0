Return-Path: <linux-arm-msm+bounces-99714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIImNFLPwmnRmQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 18:52:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B4631A57F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 18:52:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 11DB5301CEC9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 17:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF0D440824B;
	Tue, 24 Mar 2026 17:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZIYEKiq+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BtokqFkQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D4840825C
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 17:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774374380; cv=pass; b=EXajbCErNu4l8aHgRzXOyucj6mHtQ++PDxk6+VmbqjaFZeV808ml2bBOkqRxkxvkTgbkgDyQsHH1F0wj3j4Ap1eqQnMipQp5ftQP4078XAsnMC4p0Cp8JxqgjJGCz1s1uO0bRiSfO+coulUhNGPnbTPLhOBd+huRbUSjcAF8rF4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774374380; c=relaxed/simple;
	bh=b8b47Q+qOlJz/OEQW6yvG9vPt1Vy1QQe1A4hV8h2/Z4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h7ZKIi5Qawh2iolWjNdOaJZRNAcNPQElgvEemtIPYAwiBShfKbdTEPssIH4Cfa7B+rxWvdjRH7yg92iz+9rNUnDfVYNh+LP5zTu/l8C6cCUlpP/fyyLQvkdWlC1biYZ4DD3jbOg8Mjrn1PgXpXwfsr1mSlepuEgeisg6Lvmu+iw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZIYEKiq+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BtokqFkQ; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OGwTIc1291512
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 17:46:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	taYb4iREkdwPmdb/ril1O7kQAug6V2FCZ5pD57zx71Y=; b=ZIYEKiq+YRCShknY
	l0pMIC5I21sKuB9GLHoA5vXq/PPt9fEDN9mmtgY7X5IgqbXhjUoxVWhQvGXfKPnI
	zMT7VskU66KVDPGMXGA3ghDBkTttpufYsYhjiAMjJn6WzGnDk7S3k2iXRWlSl6ML
	QT2AxfiK9dKipCDgBNBAl0saekpW1aMxHqULJVsowIgSMNIDHC3nSVIq+yphTyY2
	0BR6In99hA6snZfxjdB6ltrvJT6PxwaDo5kJc8spGZzUdwHAo6WRi3IQuFJ9N2XA
	+B1jzuhjg737QdklGl/NVqY4O5DxTCJxws2EvuxHbC81zbxrrzuK7rkCUn088SjU
	aEI7WA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3sw41j5q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 17:46:18 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b068299665so53126045ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:46:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774374377; cv=none;
        d=google.com; s=arc-20240605;
        b=ZYPNXKoeBBGviumVU37WHc2fpD5CzAHLlw1S7xCTsla0wgB4AYudFJXrV+y+62ebMJ
         +n9Lmv6MaqqASlM8cUsr7urHdgiT/WJ5DJtr3Gy/fd07Q7DI+UZdnFlmqvAJJOMlWRMQ
         2mUcBzlJqyk7jkQujGlS0P809WLfWuKATqdfRKyk9NkgE2aZaYsifFY3KS2vbkRWQCcv
         CIe+irg4zVjOP76M9xbrrRc34Ys0EB4j+Ip1jXGJi/KTDtAOvZzVps6YbHS3ESit7Bua
         BCm0nkLDRi8HkkDAFfTXn+8WAwFnW2JggH/D0vA6Ptj+n3d3z/s2K4sGVaSn8ur6BrP0
         KMPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=taYb4iREkdwPmdb/ril1O7kQAug6V2FCZ5pD57zx71Y=;
        fh=4mW/PM8MqJqLl2UgvIXACJ8QxuO6k165wr7cYcYYPek=;
        b=JX/JFoLy8M4OII2U/4RJbMOaXaRV9bZCre+jUn0rIhMX/Bqq09tiz3MOuU7vfIA+eo
         ljzjx6lJN6XBhqK2zCrPnSZOVmu7h+6eFwOjpkNAPYJDjwMDPl2LfqBkKUC2+Kt6ZBYR
         Ca7aztbJ36kDz2NBozpgr7+kKWaxjcVoD856u+8uf/bqoKFAIqwv2NzLVYpj2Mm6M4pa
         HomO1Cut4q4Tl3heKHOSWSWFKytrQe5aLL2AR5tO2TSLgVAymgPPzt7qtaFPJcqyCyx9
         R+J/AsE3C8PYwfFK+hYXDtlwF20zsTaVMI15WXWTvD/cmtrcccSoOK3KkHtrFsts0n7l
         o2Uw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774374377; x=1774979177; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=taYb4iREkdwPmdb/ril1O7kQAug6V2FCZ5pD57zx71Y=;
        b=BtokqFkQBZHs6Zj4GXVXHrCW+bYTGVNgeYCpKkaY4IfOOnIs0goOnDVVnC4HgKQPNw
         NA5QOOoD7RDIHcPo98MT6obKC0BJRMnZEzzQD5sZGSkkdp8YnS5ZW+6lyDczWGO3qZEH
         KduXUSCYZxPL8LkoW5zmAHJt3lFBp005OA68mr5IlxV9IXCGyU51Vqgki7dSm7+AP3z0
         53kla5v2C07tRPtJVJOi66CJNej+QJ6Z/XhjKNDPSx66Yf7iKRzISuyh9yf6CB/LLH6f
         vwdOQhAUp1wC5sfJ2FvBOi+zP7llVu/t1P7kRgKMbi7Cabn75xqqoqXMKzEUNZei7d3X
         ThWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774374377; x=1774979177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=taYb4iREkdwPmdb/ril1O7kQAug6V2FCZ5pD57zx71Y=;
        b=Wc612OiV7dlMidX99frvAu7AAIImvf6vhkZ4SHENMrBc+y4xCo9yVEjVC7OZSmXsIL
         M9CvlYSaYE+u2ENhoaS9vw2Ypy57XtQx61/m1tYG+83PJ9GhCxCi0OlxRba4GytypTQT
         q6m7aEP1DylWY8CieI/S9gi8/aqkKxTevmbb86Wby220c4oPxTnCCDeUHYrMMEaOUXSm
         +GCkIHl/1B95v6/nzEOVO5+V36jA6mujh/pB6nnwbYmaVuFbOJOSBLIORzD0CCuGEBOk
         s+uqKDFX65QsiXFxuQP1JFA06+M0VQHCLqDiuIgs5/JRsjKnVFZsYfIK2Ouu1oRjWI+x
         N1vg==
X-Forwarded-Encrypted: i=1; AJvYcCXBSPBhhMasmI4vhD/PemXNbb8kyOqGFdQNaJSnyY01b6EYySa8IwAyIWVP4wEM++eX+H1d8MwKJe6QOuus@vger.kernel.org
X-Gm-Message-State: AOJu0YyLnUxvZdFOE2YCFyOgwCPZFzbxnIsMq8ChtiTjw7Y+PQL7Fv05
	xXf25ercr+k7kMuT7HsP/r/5QveF9QSL5mZ0rcewYrH/Yk4idvqILhGXWZ6+Wb+7GpACzqsqXhz
	8TZUh3AGmnQz57VbEtnsjAkFTdrggrfsKGB54lj01tFq55tXHxHT2HXExQ/8jizSZHoBkjNcwEu
	6Omr/ry6g5ZmRjYBQQK4yGvd3tE+rZpaeeaSQxJtBdYaE=
X-Gm-Gg: ATEYQzwIr7mxQebSnZC/GIvZT69YVnW66sT6lUJSxlpsyzj/7ZDLiVGbZT8ZDBpMiSH
	pcs09bFXTEpbnDq4Y/jrAilpd0pXN7HmP/852jvN2heaT6y9RBS+IR2c+Hc+pfKZJNNJdlvq10t
	Em+dcIOzvuoFyMMnI4uvGCFZK5PFYkYTAGtdAjk0hcRvHMU4k4nkShtQ76eXBM/bk3vTNQCLezx
	QByYEo=
X-Received: by 2002:a17:903:1b43:b0:2b0:74df:3c4c with SMTP id d9443c01a7336-2b0b0ae2f61mr5141715ad.42.1774374377474;
        Tue, 24 Mar 2026 10:46:17 -0700 (PDT)
X-Received: by 2002:a17:903:1b43:b0:2b0:74df:3c4c with SMTP id
 d9443c01a7336-2b0b0ae2f61mr5141275ad.42.1774374376845; Tue, 24 Mar 2026
 10:46:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324172916.804229-1-elson.serrao@oss.qualcomm.com>
In-Reply-To: <20260324172916.804229-1-elson.serrao@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 19:46:05 +0200
X-Gm-Features: AaiRm533bbibeblnLli9Os5sSI2o1oJJD6-ekLRbkQPKiT1MC15pgfsf7kN-Jq8
Message-ID: <CAO9ioeUhkwCPsjS4Pm5DKHZdQjLxvfy=fkcJfbF2hsgq9Ljqww@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5BPATCH_v2_0=2F1=5D_dt=2Dbindings=3A_connector=3A_Add_role?=
	=?UTF-8?Q?=E2=80=91switch_provider_phandle?=
To: Elson Serrao <elson.serrao@oss.qualcomm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEzOCBTYWx0ZWRfX2cC0vqhBbJjj
 GOT1W/dRTGuJpVw7VXgdit+GGPA/H+RFSZX6aptg8xZ8JTixD4FNh7S/WhnPfMcQQhqZKhgPtS9
 hLw40C1OFSK6Xzodb2bw6Fgy6DDVHsrPK0basCUbHyLTA5jhs/r+nTesFbrD18k9TiWYIO0ajOw
 UEvK1FNDkmmkiTiYudNaSqEjUGALht94JUKiEfXHiP702bnIIVR7ddrCprUgih3qXy5nYmIeRZu
 5LQLEub6MRqLuICqQus8rJWfQvYaCXZ2rybFzHxinTX7QXDgvdvX9tbMbaJ6tuwRcjpyNagFiod
 Ci9zbZGlWspwA31ABJUg1E5h9lYO53ZOkFHo0iF/kO+J1HB7yVrcPPCgJEn5HZCx1XWYEb2l+E5
 bvPnGzVJ2nBxM84Cxp1xTbdwXURhiEB6Xtr3ZvhxbMRU6C1OcuniaGp1Z489QEhFznAGeNIs3/c
 yJ0rbKVenIKdduAbiRg==
X-Proofpoint-GUID: YBy-pTed3KxidwZfJ9X1l-O5SClFqLA2
X-Authority-Analysis: v=2.4 cv=bpVBxUai c=1 sm=1 tr=0 ts=69c2cdea cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=5KLPUuaC_9wA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=50mKzVcxDfY0Nc3ExGoA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: YBy-pTed3KxidwZfJ9X1l-O5SClFqLA2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0
 bulkscore=0 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240138
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-99714-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: D1B4631A57F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

On Tue, 24 Mar 2026 at 19:29, Elson Serrao
<elson.serrao@oss.qualcomm.com> wrote:
>
> Hi all,
>
> This patch proposes a generic Devicetree mechanism for a USB connector to
> reference the USB role=E2=80=91switch provider when there is an intermedi=
ate,
> block between the connector and the controller in the OF graph.

Please, don't describe what the patch or the change does, see
Documentation/processes/submitting-patches.rst.

>
> Problem
> =3D=3D=3D=3D=3D=3D=3D
> OF=E2=80=91graph links are strictly point=E2=80=91to=E2=80=91point via re=
mote-endpoint, so a
> consumer can only discover its immediate neighbor in the graph. When an
> intermediate node sits between the USB connector and the controller, the
> connector cannot identify the controller (the role=E2=80=91switch provide=
r) from
> the graph alone.

DT is a hardware description. Here you are trying to describe the
software behaviour. Please don't mix those.

[skipped diagrams]

>
> From the OF=E2=80=91graph structure alone, Conn=E2=80=910 cannot determin=
e that
> USBCtrl=E2=80=910 (and not USBCtrl=E2=80=911) is the correct role=E2=80=
=91switch provider.
>
> Proposal
> =3D=3D=3D=3D=3D=3D=3D=3D
> Add an optional consumer=E2=86=92provider phandle on the connector:
>
>     usb-role-switch =3D <&controller>;

An alternative proposal: let EUD register as a role-switch and then
retranslate usb-role-switch events. This is how it is handled by the
Type-C-related objects (muxes and orientation switches).

>
> The provider remains the controller node, which already declares the
> boolean 'usb-role-switch;' and registers the role=E2=80=91switch device.


--=20
With best wishes
Dmitry

