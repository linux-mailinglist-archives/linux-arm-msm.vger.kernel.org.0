Return-Path: <linux-arm-msm+bounces-99701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EITtCs61wmlolAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 17:03:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 326D731899A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 17:03:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A723130706C2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 15:58:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40C3D38BF68;
	Tue, 24 Mar 2026 15:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cySCBaT/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AmIXZAZ/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C126C38AC9C
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 15:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774367886; cv=pass; b=H24HZreN6wu8vT9EMueo1BpTvyiGwSOeyABAdc2ty2agVAnUYPP/MYfN79EOGdpDw7nyPlo+UHPwacYtzq8WnnP1uTrUM7gpbEzY5GDPfUtYvyarIs+xXFIWyxzrpYtbOz+l5iHa0JsoLhlF8mOf0pdgYBDMt2vzkIKBxSkRd7I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774367886; c=relaxed/simple;
	bh=U7DMFwg+q2iJjApPB0UHhcc+bNMMjYSNE1WuG+detXQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KE32z4ncnl7r1W9rqpgfQK+C3QMZa8F2c9CBcd627SvJ5fOFR7tX7nJxgLRThg97Qp/7Lw6I075akrcAi1FwsKpngAZD355gSYyxbTSVDAGi/bxCW+9RGCzlUWJeMt4/q07wZSBJzWGQES7q2IRj3Kq1daIrRP88WPG5BQUNEU4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cySCBaT/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AmIXZAZ/; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OC542d409088
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 15:58:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1wWpoJyvSSyHlOMX1vzM1IdBQR5SP9psU6+O/Lr9SLA=; b=cySCBaT/y2OuNHrX
	DkTABeKgFJMbEng+rFRYUXROiAxqfKXnKkmITqfqE332GOKySzw0tOfQQnf9kLbP
	Be+o4um/oujWLcHcuGPHDkqTFpJW1PhDXquyWyFvuJlD/WdmHDLDU5E82ItL3/lN
	qhT8as0JmdZyyltpcyfeINr2FrFDQLCxQmPCAyMy7QKBztVkUF1YsBzyrXBp9PlS
	Je4Jh7uZufVsGQ+DUOeZcFz4ywnIBKfqydBMRhOtfta3O9fCZ+5ZFzcen5xT/KXx
	5hlkMb6HsWer6xgBozy+DDiaZWCzzaJ1DnjauxgRLpkHRYiE1g5K9piV+fYZAGYg
	HRst1A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3next66v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 15:58:03 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89c3e0be5ccso10201856d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 08:58:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774367883; cv=none;
        d=google.com; s=arc-20240605;
        b=Lc+IdDAaqNSUJPHrwJgN9pX0UEWvjmCE/9ljUDpYe9cnD/2TV9HLC2+YQn6cMYaGKx
         /ImQGwUAqd+HqZi08e1ZvKFZVtFQAkVG7aSGSiPRU0hzPCEDJRwRaYa19dR/s63byzCG
         xWZgpfRfHL/P/Y25yEWFKPXNChSplYqBBEnnCKI5re1OSom20d/ZuqvXH7lHtJnBeByw
         g+ctctg3ABWo53AJCcVgQDIgWum71b1kraBi6zwUUHMB+uiFXWR7Ch5fVV9xWYVBdiu6
         qE0Ekvypy0JCOuhCfVnA70Z6A+CHC/jYOiHSpOrHWJdNxFqrUDCfEnGffotqd851fRRf
         7juQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1wWpoJyvSSyHlOMX1vzM1IdBQR5SP9psU6+O/Lr9SLA=;
        fh=lLsxfsbt/qLVUwO5byd7d3PyoE5ekA5kUBaAmZX9RSs=;
        b=HoG6L7EaB1hqQVR9pblvm5Kow5CFJZyrkPigfWwW0Gat0koFFaSo6dg9cgC/nKwyp2
         w19oBYKyV1hdBZuTlfp8E0lObWk1PKMltWQDKWhYNsg7kLcDCB8IbKxUjW6MroGFhoDW
         bR8CUHFrCS/E2vNVAWoSMDMU9F0jFHJSPVg0D69UAyYad6WlbdO2dRwC339MxFTmb0u2
         otRtlFu0DfLIT0BJpYb5pJ/sptDrVjc6h35ablUmljJZCWnOdTDsCLWpowXk6aoqT13D
         8UzyKlkXc8bXLKj57qQj11c8ISw97qlGTYJgTZkXCPc2PSb/6N5xGxguRAXY3qFkiJFU
         KMAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774367883; x=1774972683; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1wWpoJyvSSyHlOMX1vzM1IdBQR5SP9psU6+O/Lr9SLA=;
        b=AmIXZAZ/D21yR3LUKf6hLOhKzqWXl6tR2ijkPFfAcW/ijsxR5HctPo+/XBCrK2YxkR
         nwWmEw7BU9t0yUfPeqmILfNR2yeFhZq6q+SEWqRFkTh9nx03cXIQ0KQEJJiX+qerRYa4
         5NzLn7nIUT5ERZP0EksUbptYf0H+CyabCQzfRmJgp0EjHD/54HJV/p3q/SxcY9nniAFV
         z9rC1kG2VDAadZYu/eglDZ79s5u6dPYQGCmxqVm7jxcgFn+RB08DbeP0zx2wK3/RuASz
         nQc5FlhHSP6KncqUDU7uT5rVzvvagIJpVCfmwXzA1Nk31TcbvDx0Fw29XtR/f+9qC2GV
         ec1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774367883; x=1774972683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1wWpoJyvSSyHlOMX1vzM1IdBQR5SP9psU6+O/Lr9SLA=;
        b=aMDfaHado6SqNe2YURMZtYoj8csvQIn1ZadX7dNwde7rnHDPGlJ+ZkV5TRD7ccuRjQ
         bhxJlg7RET7G20z2rCqr5mM02Opr8AbW4E0fmYuN89TmhU29wEc0LHAjMs6jka/QEY03
         zCd3kffbzvw+7vwS37EHSjjInx6VO+vSoKwavsokdm3BLE6/uzJvqhiwZYaNyPz2QHLV
         jIx64izau/VJhMcXu1sWLoybrgQSnHicH2EaUh962Wo3SOPX8pJyFdA557m2IyqSQsVl
         XeSseEsT8DwtNrxdMPvBExC6lnzc8+2P3LQtq8OAYa+xrFQH3So9NXt/9LRNeQh8WUWJ
         jSbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXh007t32qDjen/H5D9c1jMNizW2EzAJ/rzSLF8sfTNKDBT8zAHi57MAV4ZQPp9v7gvkq9TQ3GLIATDbFst@vger.kernel.org
X-Gm-Message-State: AOJu0YzDtNIg1bQMR3NSs8OrAsiSNn4hLFztesLO1JjeYzCZsRUtT48j
	24Ul4+xvQ+d0+dPkcN9SkYtuu1Padiq9p9viQC975dQLDKDrj1EssIKMxxTgivZW945iws/TIE8
	pVjN2qnm20fSiC4ftmZFM1ETj96ON9go0bxPExAVGuf3JNSRHER1VfEhyvJeJ90vOgs8jTaVZ0k
	oXscIoBewu2irEGaraX4tdDck8QGqhtEp8x19cuxSgUXY=
X-Gm-Gg: ATEYQzw0AKepEa5bRtlp1Wsd/A7Yt7qiEKQwVsRV1/loZAtAzZfTDfmU2ew1CSvr1Ej
	L9suLiQkNmOFMN+wkz2BLmikf9+RsL8UobXJnspIL9G24RDxEEzeA7a5HDuME0FxeA69tPAzgc+
	TXTjQ08NE5+aAYZugNxa4dYEw+CX3uBSdwYQsVmtq4hPRFvvyGZGIV5Ukc5tSlupTtDZ6df2iAz
	EqOrCoqCkrWh+d23Tz/5xTMfPyqemSu+WVp0S4=
X-Received: by 2002:a05:6214:570d:b0:899:f5a4:8110 with SMTP id 6a1803df08f44-89cc4adc756mr1982406d6.56.1774367882667;
        Tue, 24 Mar 2026 08:58:02 -0700 (PDT)
X-Received: by 2002:a05:6214:570d:b0:899:f5a4:8110 with SMTP id
 6a1803df08f44-89cc4adc756mr1981856d6.56.1774367882087; Tue, 24 Mar 2026
 08:58:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323125824.211615-1-loic.poulain@oss.qualcomm.com>
 <m61yNNvSrw6AIq7_-g2h7VQLmGJ_5iCLg5JTlfQDcL5LlBq37ifAeXw-K3AlRBck5Mb4uVQq0pzeBNAybQNk4w==@protonmail.internalid>
 <20260323125824.211615-3-loic.poulain@oss.qualcomm.com> <1ba54ec0-be51-4694-a79b-f272e76303d2@kernel.org>
 <X-Lw_zi1o015-V1Cv4dY_ik6SfTB8TTcLmn1l-Ta7UviYTJ6gwMBn4B4ulYwjd_Aetul5xUt0T6ln9E-Hl5h4g==@protonmail.internalid>
 <CAFEp6-3ziXJTYADOFj--rZL5TumroXuW+=SnUQ9XakRxHT-ypg@mail.gmail.com> <12194cc0-0960-486c-be7e-1a22d95de340@kernel.org>
In-Reply-To: <12194cc0-0960-486c-be7e-1a22d95de340@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 16:57:51 +0100
X-Gm-Features: AaiRm52QkkxQCqRqr-Jt62eDyvDcyXaIOYwIWRquF6V_Pbmf84Rb_fN-zDuHgQA
Message-ID: <CAFEp6-0qb4SUrNZ03+EsEj6qAynH2RL+AQG6F1F8K0ceX3JpUg@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] media: qcom: camss: Add CAMSS Offline Processing
 Engine driver
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: vladimir.zapolskiy@linaro.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, robh@kernel.org, krzk+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        johannes.goede@oss.qualcomm.com, mchehab@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEyMyBTYWx0ZWRfX3XK3V+ZGMo/K
 WHFIdW5mx/VKEkS4FQhuLqkGrpd01CgnrZoP/5e7vYVLYdTzzselgjhXiLkeVMqGvfUGgkdGFHe
 nbYDYi6aHbnpwEQtbexms3seTQmDsqMoGjrEXT3MfSZYiyCTZxyBq45O+Jdvh1H7+PdZNAJmC5n
 rIuZxNlj7a46VoglRPkY3swMmPk3pA1I6pYfpnDr7c4ias+J/bP3nq559n7HX7T0fzxSvHEBfvL
 hJ6xiAXdbYf0LaLTdWMYYtmNdN5qBH/6dOumQ/shJ3kq6hwksKGt40223NYLqeJYHHCXXHFOHEC
 Cdja9b1M+6BYRmYlx/Ot8o16aoC4nAGRh/OZBHk6jzw2kojDTUJXRVGfBZZQ95w//2zs5AyTnzM
 xtakb2JEvGjbKu39t+WjWeZjjb0g6+Ahry1DpRO5gkOFsix/I2DY8hFVcFnLplzJv1d9szBr79J
 fE0YwP0H/v5EUmjD9MQ==
X-Proofpoint-GUID: 23zOaDypAd1CeyuRk3p8VPYwLF-nF7du
X-Proofpoint-ORIG-GUID: 23zOaDypAd1CeyuRk3p8VPYwLF-nF7du
X-Authority-Analysis: v=2.4 cv=Bd/VE7t2 c=1 sm=1 tr=0 ts=69c2b48b cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=lx2B71hQoDIPyAvjx6AA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240123
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99701-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: 326D731899A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bryan,

On Tue, Mar 24, 2026 at 12:00=E2=80=AFPM Bryan O'Donoghue <bod@kernel.org> =
wrote:
>
> On 23/03/2026 15:31, Loic Poulain wrote:
> >>> +
> >>> +static void ope_prog_bayer2rgb(struct ope_dev *ope)
> >>> +{
> >>> +     /* Fixed Settings */
> >>> +     ope_write_pp(ope, 0x860, 0x4001);
> >>> +     ope_write_pp(ope, 0x868, 128);
> >>> +     ope_write_pp(ope, 0x86c, 128 << 20);
> >>> +     ope_write_pp(ope, 0x870, 102);
> >> What are the magic numbers about ? Please define bit-fields and offset=
s.
> > There are some registers I can't disclose today, which have to be
> > configured with working values,
> > Similarly to some sensor configuration in media/i2c.
>
> Not really the same thing, all of the offsets in upstream CAMSS and its
> CLC are documented. Sensor values are typically upstreamed by people who
> don't control the documentation, that is not the case with Qcom
> submitting this code upstream now.
>
> Are you guys doing an upstream implementation or not ?

Yes, but some configuration will be static and non-parametrable, I
will check if we can at least document the layout.

>
> >> Parameters passed in from user-space/libcamera and then translated to
> >> registers etc.
> > The above fixed settings will not be part of the initial parameters.
> >
> >>> +}
> >>> +
> >>> +static void ope_prog_wb(struct ope_dev *ope)
> >>> +{
> >>> +     /* Default white balance config */
> >>> +     u32 g_gain =3D OPE_WB(1, 1);
> >>> +     u32 b_gain =3D OPE_WB(3, 2);
> >>> +     u32 r_gain =3D OPE_WB(3, 2);
> >>> +
> >>> +     ope_write_pp(ope, OPE_PP_CLC_WB_GAIN_WB_CFG(0), g_gain);
> >>> +     ope_write_pp(ope, OPE_PP_CLC_WB_GAIN_WB_CFG(1), b_gain);
> >>> +     ope_write_pp(ope, OPE_PP_CLC_WB_GAIN_WB_CFG(2), r_gain);
> >>> +
> >>> +     ope_write_pp(ope, OPE_PP_CLC_WB_GAIN_MODULE_CFG, OPE_PP_CLC_WB_=
GAIN_MODULE_CFG_EN);
> >>> +}
> >> Fixed gains will have to come from real data.
> > These gains will indeed need to be configurable, most likely via ISP
> > parameters, here, they have been adjusted based on colorbar test
> > pattern from imx219 sensors but also tested with real capture.
> >
> >>> +
> >>> +static void ope_prog_stripe(struct ope_ctx *ctx, struct ope_stripe *=
stripe)
> >>> +{
> >>> +     struct ope_dev *ope =3D ctx->ope;
> >>> +     int i;
> >>> +
> >>> +     dev_dbg(ope->dev, "Context %p - Programming S%u\n", ctx, ope_st=
ripe_index(ctx, stripe));
> >>> +
> >>> +     /* Fetch Engine */
> >>> +     ope_write_rd(ope, OPE_BUS_RD_CLIENT_0_UNPACK_CFG_0, stripe->src=
.format);
> >>> +     ope_write_rd(ope, OPE_BUS_RD_CLIENT_0_RD_BUFFER_SIZE,
> >>> +                  (stripe->src.width << 16) + stripe->src.height);
> >>> +     ope_write_rd(ope, OPE_BUS_RD_CLIENT_0_ADDR_IMAGE, stripe->src.a=
ddr);
> >>> +     ope_write_rd(ope, OPE_BUS_RD_CLIENT_0_RD_STRIDE, stripe->src.st=
ride);
> >>> +     ope_write_rd(ope, OPE_BUS_RD_CLIENT_0_CCIF_META_DATA,
> >>> +                  FIELD_PREP(OPE_BUS_RD_CLIENT_0_CCIF_MD_PIX_PATTERN=
, stripe->src.pattern));
> >>> +     ope_write_rd(ope, OPE_BUS_RD_CLIENT_0_CORE_CFG, OPE_BUS_RD_CLIE=
NT_0_CORE_CFG_EN);
> >>> +
> >>> +     /* Write Engines */
> >>> +     for (i =3D 0; i < OPE_WR_CLIENT_MAX; i++) {
> >>> +             if (!stripe->dst[i].enabled) {
> >>> +                     ope_write_wr(ope, OPE_BUS_WR_CLIENT_CFG(i), 0);
> >>> +                     continue;
> >>> +             }
> >>> +
> >>> +             ope_write_wr(ope, OPE_BUS_WR_CLIENT_ADDR_IMAGE(i), stri=
pe->dst[i].addr);
> >>> +             ope_write_wr(ope, OPE_BUS_WR_CLIENT_IMAGE_CFG_0(i),
> >>> +                          (stripe->dst[i].height << 16) + stripe->ds=
t[i].width);
> >>> +             ope_write_wr(ope, OPE_BUS_WR_CLIENT_IMAGE_CFG_1(i), str=
ipe->dst[i].x_init);
> >>> +             ope_write_wr(ope, OPE_BUS_WR_CLIENT_IMAGE_CFG_2(i), str=
ipe->dst[i].stride);
> >>> +             ope_write_wr(ope, OPE_BUS_WR_CLIENT_PACKER_CFG(i), stri=
pe->dst[i].format);
> >>> +             ope_write_wr(ope, OPE_BUS_WR_CLIENT_CFG(i),
> >>> +                          OPE_BUS_WR_CLIENT_CFG_EN + OPE_BUS_WR_CLIE=
NT_CFG_AUTORECOVER);
> >>> +     }
> >>> +
> >>> +     /* Downscalers */
> >>> +     for (i =3D 0; i < OPE_DS_MAX; i++) {
> >>> +             struct ope_dsc_config *dsc =3D &stripe->dsc[i];
> >>> +             u32 base =3D ope_ds_base[i];
> >>> +             u32 cfg =3D 0;
> >>> +
> >>> +             if (dsc->input_width !=3D dsc->output_width) {
> >>> +                     dsc->phase_step_h |=3D DS_RESOLUTION(dsc->input=
_width,
> >>> +                                                        dsc->output_=
width) << 30;
> >>> +                     cfg |=3D OPE_PP_CLC_DOWNSCALE_MN_DS_CFG_H_SCALE=
_EN;
> >>> +             }
> >>> +
> >>> +             if (dsc->input_height !=3D dsc->output_height) {
> >>> +                     dsc->phase_step_v |=3D DS_RESOLUTION(dsc->input=
_height,
> >>> +                                                        dsc->output_=
height) << 30;
> >>> +                     cfg |=3D OPE_PP_CLC_DOWNSCALE_MN_DS_CFG_V_SCALE=
_EN;
> >>> +             }
> >>> +
> >>> +             ope_write_pp(ope, OPE_PP_CLC_DOWNSCALE_MN_DS_CFG(base),=
 cfg);
> >>> +             ope_write_pp(ope, OPE_PP_CLC_DOWNSCALE_MN_DS_IMAGE_SIZE=
_CFG(base),
> >>> +                          ((dsc->input_width - 1) << 16) + dsc->inpu=
t_height - 1);
> >>> +             ope_write_pp(ope, OPE_PP_CLC_DOWNSCALE_MN_DS_MN_H_CFG(b=
ase), dsc->phase_step_h);
> >>> +             ope_write_pp(ope, OPE_PP_CLC_DOWNSCALE_MN_DS_MN_V_CFG(b=
ase), dsc->phase_step_v);
> >>> +             ope_write_pp(ope, OPE_PP_CLC_DOWNSCALE_MN_CFG(base),
> >>> +                          cfg ? OPE_PP_CLC_DOWNSCALE_MN_CFG_EN : 0);
> >>> +     }
> >>> +}
> >> So - this is where the CDM should be used - so that you don't have to =
do
> >> all of these MMIO writes inside of your ISR.
> > Indeed, and that also the reason stripes are computed ahead of time,
> > so that they can be further 'queued' in a CDM.
> >
> >> Is that and additional step after the RFC ?
> > The current implementation (without CDM) already provides good results
> > and performance, so CDM can be viewed as a future enhancement.
>
> That's true but then the number of MMIO writes per ISR is pretty small
> right now. You have about 50 writes here.

Right, it will increase significantly. The idea was to start with a
version that omits CDM so that we can focus on the other functional
aspects of the ISP for now.

>
> > As far as I understand, CDM could also be implemented in a generic way
> > within CAMSS, since other CAMSS blocks make use of CDM as well.
> > This is something we should discuss further.
> My concern is even conservatively if each module adds another 10 ?
> writes by the time we get to denoising, sharpening, lens shade
> correction, those writes could easily look more like 100.
>
> What user-space should submit is well documented data-structures which
> then get translated into CDM buffers by the OPE and IFE for the various
> bits of the pipeline.

Yes it will.

Regards,
Loic

