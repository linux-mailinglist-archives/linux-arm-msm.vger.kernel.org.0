Return-Path: <linux-arm-msm+bounces-106490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sEKYEJy+/GnSTAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 18:32:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C40D94EC45F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 18:32:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 248F6300AEE5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 16:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9945544B690;
	Thu,  7 May 2026 16:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rdl4r/T5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ixL73Wsd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDFF536F429
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 16:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778171459; cv=pass; b=Wd0iL70Xlbaguo24O1hjhsNaWv1ketL1qeVlogwEYPFpHZB/U7z91BfT+z6x2PxcYzwSxlozPr2x+Bbx8DCCtWMDEiaE+1yQYXIhRPBdUUy5wkVoS7rp6GcvNv4iS+JVHbCzUG5YquEMZkY8mcykPefw+cFtz0fQCcFa04r6qjs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778171459; c=relaxed/simple;
	bh=cnL86ayqLgkXjsYy+J/y4ZtudRCbYXMrQtM7jZ/hCt8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lb3g21xsKAymPfbbAV4/7fD9k+sy/Km/lIvvP2p3JucaegQVgvnE+aNMAuazOycFOaRbQSIbbgRKuvsoQ9MnSuVicQuadOyCMZP1vzsFDfMhsjM6wHDz6wrNZvvnX4PAtFKbxBOFdohKtL1p3jv1WxdamLGzYoBj7biRXayqdZ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rdl4r/T5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ixL73Wsd; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647Fdm1g3463973
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 16:30:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=BsZKRUYByxu4l1012X9BuJO08mB3a5+PDVH3rrgpa+o=; b=Rd
	l4r/T54zzKLtFWtx02KlaRHA9qZF1yUfdhzU+NuMwe6VW1/5jZZc76xlX1I1myVA
	GUYR+93AvmVW5Pxb+1fOdiC3JhCz6RokwhUeg6HSJZ917Z4tu1v/dFgwezjzNIPq
	SO+gu5QTIT6C66TfsNpBHzBWtyC3qaESGyJMxBnlk3bojwsBTJ2KDeUPouy9YEeA
	do9fDE5TEp/TyK1sA7NCAosMHzzp6+o9LAhKfqudrN0dWiAiG9o5JeOOaY1/PEgC
	vOYWar+0RuxSNFAiHuq2pLVbQZXmt9PNdXXQG4ME/kVmTA2XC4MdbbXsblj+x8W3
	1AKlD9dz2xrjmq/mdj/A==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0hvn35g2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 16:30:57 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-434f1d398cfso1823592fac.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 09:30:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778171456; cv=none;
        d=google.com; s=arc-20240605;
        b=YqJ1N1SR9AalAjhi9RLTh08jj1fbUwRZaBSdVENH7wEyK5rBj89SBW0w1ZZu0i4DD/
         GUwVGlb3GVK3hpgaI3YBEgKa/d/KSC/oYZEES/hwhNgCnam7IMkPTfIRjC0O55JPnlai
         va4/Gb52ntvKMKAP5Tl2Sao1Xu6GzvVq6T5Ngk1Yi3YjA2kS/F69tkOcmqSy2lLc2Rhg
         nQSgaU5hBsP3VJwi9Le9WlqMGUYE+7VNBYfWpkU5yaYJYAoqUS2rJRtZh9FPMPxHh2/2
         V668XyjmeL6HOzo0HTo6t9swvPG86PeVTyp9Hfp9vdEhK85q9WoKxLHePTt2rh4EgMKT
         9qEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=BsZKRUYByxu4l1012X9BuJO08mB3a5+PDVH3rrgpa+o=;
        fh=L6v8fiWc+OxxpaPFj6OcoZXkrWx+xIsFcbXpWsLTlko=;
        b=Lm8lB3Wo/wEMvzBfHchY2plSlko6WwCQx1x5SuLSi30gQWlgkI435sjmf6Tzf4VvGw
         yXmYIZpRhTkn1TGE6EtFO2/VlLIc9AqmLj6jrM//jErUdSouAxL9CvxlCqDLFEl9xMGo
         y3akYZyprTaT2uaguDRuMfCId5oyWYE+dGHA0sYoKD6DgZtv5EtfYIonwWQQHLRnCfAh
         xRaamGR2UlwkhHlhbbpbBNGWT62wWe425RAnc2bC2/b2hGl95vRMjnIZwqTI0zDZ644d
         +z5msEr+mn4Wtl1YJkiATnx0jfsqVI/LdivI5uy1ySTMJSkz6UPyP7DUSBFesUZHMtvw
         NNYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778171456; x=1778776256; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BsZKRUYByxu4l1012X9BuJO08mB3a5+PDVH3rrgpa+o=;
        b=ixL73WsdPxNhFffg6OT6mNUEcOvf4ZkvfdsZup9KXyG7MQZgjpoXZ2vPo3SVQM9AbO
         odQxsHdxdv5fw9xKCV3aKqJd7+MffzIFf3GEYGtCqsnTpUeN1fEQRUNWJO5qfKZyIzOy
         +eL09fUqPoYX8BGMMCoK7lFLwr/XhwDz4kPVqIfKgd8cu/wdZ3xFlB0AG0HTmdLzg6VK
         ydg3LXTLBhbrk3RPDSYXZn003quT4MrcYyxsML37UICdxi1vO0qsiKr4oIzs7SUdaiSf
         U1az/qvBSb1wRaHO/o05HHOa64N2Q+69DcZ3mkAfgWl5lTg4jVx6g+WcsG8FWQ4oy1lW
         PbKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778171456; x=1778776256;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BsZKRUYByxu4l1012X9BuJO08mB3a5+PDVH3rrgpa+o=;
        b=NT5mLgBDxye3Rhg6CndH0QX3ruoyJc3Mrgk2k9uUAdgBAoNL1WBqW+UQaii1N+1u/5
         rGXUrU0SpIx97IEAn/y3n5FOtARlqzp0xT9dZNCqrZzbucRGfPO+Z71+Mt36MesqS84A
         Kbnlr5rZmHnAcqf14+UTylU2mP2yeYpFLhN3/f0hK3Ge1cVs8jGa6mU+WUvtmmqmr+5E
         bzH0I3IQS2Ci+GhjdL3fhb2IHEIEEQK0iqI+R3yaetp2j3FRuNPcR0rf7dJO80ATN5VZ
         kJkXoXW6eWJ05TCEL+db8wMowwC8q6vNom5A2HpXXDujb7Ju7RXjnI4QwLvSEzBa3+F1
         5xDQ==
X-Forwarded-Encrypted: i=1; AFNElJ/TUf4S4f1P2x0/lsfrg9ItBekvJ+fxz2UP43sIX8hQiRNm8/9tjdw6AfmF+kAJR9exZqmKEK8H2+V3AnpJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yylma2ciuOpgHvBJPYEGHV3ps7IotqV8ipCgm0ckPVzamObO4bY
	2YRIVnYSqQz4tIeyQ8ENKfs5yStAGcetCioUcZRaNKbFqHzoPt6s+2tp2yhPo5ozZgCURjT6M1+
	t0sNtqOOdTdYhKWyZX4+jOW119i/sPHSIMyAfbZVXC6A/acuYFJQPw0ATH9drcGGrkUTKF/23zd
	AHkLCiamV+5XqZQW50q+1Ramp9F1ClKzI/0rFSp5H8aWE=
X-Gm-Gg: AeBDieuQ2igUOwYh03SP00EjT+V3k+8lQAFv66nmluWmvHZMlpqSLf24kg+ih0oQHf/
	dE4nUZ4mTdI7qmTvHvycBG3LrKxBsgFmbPFZiSdiYsTz/sGgxoNwi03jtpGyDJsNU/Uuf+J5JBg
	FLXMJmlNGjnKBbdUXvH472ZuUP5DpCx2GdGFOAM4mRBzjQGLiLndwY6/QLjVaRp1t0EL1z2z3+h
	9Dyhf4Y/OJhRzeAL8UqGHddEwUDkvn0r/70Vw==
X-Received: by 2002:a05:6820:1610:b0:696:1a85:586b with SMTP id 006d021491bc7-69998d103cemr5072089eaf.35.1778171456076;
        Thu, 07 May 2026 09:30:56 -0700 (PDT)
X-Received: by 2002:a05:6820:1610:b0:696:1a85:586b with SMTP id
 006d021491bc7-69998d103cemr5072031eaf.35.1778171455539; Thu, 07 May 2026
 09:30:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505-wb-drop-encoder-v5-0-42567b7c7af2@oss.qualcomm.com>
 <20260505-wb-drop-encoder-v5-1-42567b7c7af2@oss.qualcomm.com>
 <CACSVV00TsXn=yx2UeGpxvCWRkSdj0=_=3_s01wCaO1RDH8t_vA@mail.gmail.com> <f6d9e805-328d-4d9c-8a40-32b47fcedd51@Igalia.com>
In-Reply-To: <f6d9e805-328d-4d9c-8a40-32b47fcedd51@Igalia.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Thu, 7 May 2026 09:30:44 -0700
X-Gm-Features: AVHnY4ILuojm3YrKxuKRouawRWPTWPOauo6Ler8XHGih8TS8VtJV7DK7zmGptjA
Message-ID: <CACSVV00zgV02t0CGaDUJyTGBceBk7MFaOQ7Uc6ynpRkxdBwZhA@mail.gmail.com>
Subject: Re: [PATCH v5 1/8] drm/msm/dpu: don't mix devm and drmm functions
To: John Harrison <John.Harrison@igalia.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        "Kandpal, Suraj" <suraj.kandpal@intel.com>,
        Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
        Rodrigo Siqueira <siqueira@igalia.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Louis Chauvet <louis.chauvet@bootlin.com>,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE2NiBTYWx0ZWRfX8nEJ9DqUuugX
 bs0Pdrcbg3SaQ9GNuRmGJZvOhydcek6qFQJnAuomGAO7iAyKgymTx7VrcTumvIsveof3GHFNYI5
 MjrEAMBAeDOCR1XuxoZWgypIrddoD/djBbHDkQSypAXf5vgDSV2jyMf7O/ANGhy+YV7wcm9/Qvx
 dErXu7sp+kECxcDacq+QqRWnCyE7xHJbSHTaOWtNxtXE0nIDdtaIep6KmAE56hn9v0AnQT1pg4L
 b5B5cLZTUyFfHdFQlSzIIK5gWol31imuN4i8CIETVQqA4zjigIGu46N4/tsoFE0wn9hsNFrNcsm
 6ZIdwFUTGD1ppTWsvg1IR6e+YM6rnHgycqkcmhaxoQcl3bgTuvReU9WbrMz+yXND3UefF6QKbo4
 PBzdWdcxt350bP7dZTmGOeVfKlVzb82KcGY8wfYC7WQh+FW6PIuzVGXMwF1bqM0+tSUyYgvp+M4
 0oAicrUJAYvykB9iX6Q==
X-Proofpoint-ORIG-GUID: JtHS7qSpMHANCxkpONy1SXkYNkb_jhw1
X-Proofpoint-GUID: JtHS7qSpMHANCxkpONy1SXkYNkb_jhw1
X-Authority-Analysis: v=2.4 cv=ZZ4t8MVA c=1 sm=1 tr=0 ts=69fcbe41 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=V2sgnzSHAAAA:8 a=EUspDBNiAAAA:8
 a=IvufwBvwVn8Rb4eIr-0A:9 a=QEXdDO2ut3YA:10 a=vh23qwtRXIYOdz9xvnmn:22
 a=Z31ocT7rh6aUJxSkT1EX:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070166
X-Rspamd-Queue-Id: C40D94EC45F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106490-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.intel.com,intel.com,amd.com,igalia.com,gmail.com,ffwll.ch,arm.com,kernel.org,suse.de,linux.dev,poorly.run,somainline.org,ideasonboard.com,glider.be,raspberrypi.com,wanadoo.fr,bootlin.com,lists.freedesktop.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[36];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com]
X-Rspamd-Action: no action

On Thu, May 7, 2026 at 9:29=E2=80=AFAM John Harrison <John.Harrison@igalia.=
com> wrote:
>
> Resending because apparently it got sent as HTML and was rejected by the
> mailing lists...
>
> On 5/5/26 14:49, Rob Clark wrote:
> > On Mon, May 4, 2026 at 5:25=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >> Mixing devm and drmm functions will result in a use-after-free on msm
> >> driver teardown if userspace keeps a reference on the drm device:
> >> The WB connector data will be destroyed because of the use of
> >> devm_kzalloc()), while the usersoace still can try interacting with th=
e
> >> WB connector (which uses drmm_ functions).
> >>
> >> Change dpu_writeback_init() to use drmm_.
> >  From [1] it doesn't sound like userspace holding the drm device open
> > is the issue (if that were possible, it seems like it would go badly),
> > but rather the order of managed cleanup?
> >
> > [1] https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git/commit/drivers/gpu/drm/xe/xe_hwmon.c?id=3D3a13c2de442d6bfaef9c102cd109=
2e6cae22b753
> So is this not an actual issue that has been seen in the wild? It is
> just a theoretical issue based on code observation?
>
> If so, then maybe the comment should just be something like:
>
>     dpu_writeback_init() was mixing devm and drmm functions - allocating
>     using devm and then passing to drmm to manage. This creates the
>     potential for a use-after-free bug as drmm and devm have different
>     lifetimes. Fix that by consistently using drmm management.
>

I've not seen this issue myself, but I guess Dmitry has.  That comment
sounds more in-line with what I _think_ is happening..

BR,
-R

>
> John.
>
> >
> >> Fixes: 0b37ac63fc9d ("drm/msm/dpu: use drmm_writeback_connector_init()=
")
> >> Reported-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> >> Closes: https://lore.kernel.org/r/78c764b8-44cf-4db5-88e7-807a85954518=
@wanadoo.fr
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 3 ++-
> >>   1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/g=
pu/drm/msm/disp/dpu1/dpu_writeback.c
> >> index 7545c0293efb..6f2370c9dd98 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> >> @@ -5,6 +5,7 @@
> >>
> >>   #include <drm/drm_edid.h>
> >>   #include <drm/drm_framebuffer.h>
> >> +#include <drm/drm_managed.h>
> >>
> >>   #include "dpu_writeback.h"
> >>
> >> @@ -125,7 +126,7 @@ int dpu_writeback_init(struct drm_device *dev, str=
uct drm_encoder *enc,
> >>          struct dpu_wb_connector *dpu_wb_conn;
> >>          int rc =3D 0;
> >>
> >> -       dpu_wb_conn =3D devm_kzalloc(dev->dev, sizeof(*dpu_wb_conn), G=
FP_KERNEL);
> >> +       dpu_wb_conn =3D drmm_kzalloc(dev, sizeof(*dpu_wb_conn), GFP_KE=
RNEL);
> >>          if (!dpu_wb_conn)
> >>                  return -ENOMEM;
> >>
> >>
> >> --
> >> 2.47.3
> >>
>

