Return-Path: <linux-arm-msm+bounces-100107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHq6DukcxWnr6QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 12:47:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF8D334B14
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 12:47:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 45B793045AA0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 11:42:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9870B3EFD03;
	Thu, 26 Mar 2026 11:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C1ObYSbW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WIjPEtf7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D323EBF08
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 11:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774525373; cv=pass; b=ErxOMlcvpOk8oHJ4RoU+Pl9q6yttsrfcr6/xWajXNdingp7uZPq0dA8uZAGm9vWVwbSCy+YF/RFs+3KVt/fGyn0TZvnVb9UryKBG6tC6APqFftfnQzvUvGcd5OX0Km7/4hyPRYYwKFwO21Sx7nbnWlKpgCYpb6yJAXy5iraPaqA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774525373; c=relaxed/simple;
	bh=XZnEY+PXCYFTUIKxsHTQTOQdmnrTCBUbZux8mOVUkp8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mun663yiYScp0ZIOmkw1DnferOcjcSukyHrmcuzsGvO00KzsBB++VjZDX3GxVxWvVhtojGDSSyrlR/W4hl3c0l7ibaI3pn294mEEQRsY8jp439K4J0PjnM4YqdPUmxsZrGfJGzzTPCt1Q4U01vm9uLA9jGZ2lleqHTyr7N8nF+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C1ObYSbW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WIjPEtf7; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q6F6eO054715
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 11:42:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XZnEY+PXCYFTUIKxsHTQTOQdmnrTCBUbZux8mOVUkp8=; b=C1ObYSbWiwpCagR8
	PCkhkCO+GXK50Qtp7sDAjSeZkGc90lzWu4RUVAmdXsngOvdubpYWk59L47Iwgkim
	RKQ0z/9x3G2R0rS9Ov8Plj78TrpoyRCGGAhM/Dg/sfIMNWg0FR890NxArZgAPT3r
	cGYaMEJqwlGZAP5VAB9vSPvt93H/4+eHJdc/76+JIt8ZbM/q3y0cvDN1MWs1+wrF
	huqzVEAGVWpPyC5EjR9lWZUvXitGXJS7iKWJUVg8cy27WrI5CTcwz4o6XEdvjG+D
	ajhmt876F1YtrHRC5OKQ4tZWLhmR1EHGItRMh7PbfbyyplcVPEovOy5XW1ExV0+x
	Sas20g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4q1t2mm1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 11:42:45 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89c4d85d619so21665396d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 04:42:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774525364; cv=none;
        d=google.com; s=arc-20240605;
        b=EVBOPGmMfLllup+8QgtGKcHjbTYpmgesxXYjlZcrfcyzc3rzGOuvKptejPIcKJIJdG
         Zit5kcsdKDjqw5ej2u1NwRwKb5MAzXZfo1cTMLnXyd/J9VdKAI8j2DmqAIxeLwg434pF
         mNPvEYwacg9WYL5JI34WODx8tmO3qYxpOAsa760nngP01uKlJNrgSrHWvPkVjhXJ0enc
         HrY9TG4dXIi6Qbbx3tL9m3OpAUS31p5VR4w/VDIemBOvhPC7eibQVy/3so1noEQzy4z4
         qYFBCTdh9DqNFzpLT+rFp7p2G0l+vVPf0r+Wmo8M+EfFYAepn2nCjTIIQgj1CEqkX41Z
         kJHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XZnEY+PXCYFTUIKxsHTQTOQdmnrTCBUbZux8mOVUkp8=;
        fh=I7DXjhjQVf/BdTpjHy/McR84hOk/iovk3ZW2FlQVIUM=;
        b=UZ7xmpI4eeOJ9zt0Pu6AodcKtbZMGjsUQZesCivwv0auA/AZhhuNoIL/awZmpRZI1u
         olt1GRXV/qYMt+WGFD+opRQ0hwgaskL0Q+Px8KVKKkliQuR9LmEylsMUZDhFD/JissGH
         DC0IpEX5RoQhnub8NN1M48Jo37z7sAQKXdqoj/9l6gOlcR6uAYS0PSUcTPsgGxbA/8vf
         zpu55UfmjjoIfQVuWRno0Dnm7IDm81bTFlwZpKrASlKXMNolVoZkz84csqLu2aGRLeOy
         PQ20Fc4SKcGcpaqPvlmJya9ObGC6nVq1Dh9gpHixtzrvS6Rhf77jiTLAD3sysnB4LJpv
         +LxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774525364; x=1775130164; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XZnEY+PXCYFTUIKxsHTQTOQdmnrTCBUbZux8mOVUkp8=;
        b=WIjPEtf7ypeubV1XgBR7R71VSos/Hdemf4GqYh3AVJwt/yuPUdyiJn5axAMWRVSZ+Q
         shVJgigYvdYOGIofbcPfpwNTYtTI45Fl2fNMv7l3dX0vvIf2TnVniAQvJCd7pmAL5Iq7
         QpF7WDgSjfjf51yaN/7M3SPxKRS6t191+uZijkfBtZ+y6CyBcS5GHwjTje8f/OLjh5GG
         LcZ/lrVFgMgreyfqtw+9xoJcydVAJ0niAvGanQjbIsHC6b0yB09q1Lw7ErQw2Pc8uHX5
         ZKf1ypZMod0A7PdEksNPv4B734WjVyF5Mu06i+JiBLF0iRrBykxoCwNPhGAB+Yc6MD8c
         Zj5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774525364; x=1775130164;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XZnEY+PXCYFTUIKxsHTQTOQdmnrTCBUbZux8mOVUkp8=;
        b=Nis+bh1NzsZqeXi1snKRx5/l4pyMuae+UPZ4g4ufPAKpv+gp0t1sVnDBSGUYwQVhwU
         8RVgCi6zB5ge4/2yjUFx/1VoNlrHkcjxIwtqfdU6ZmNnRS93GGjBJz/WWIjNs/jIOIOS
         xdCuwREl/LkILljozl7tLq0syKUp9f6pBD2csjBjTQjSju4jTKKJRBJGtmKIy8wXwD3U
         6ezL15D0kYJQc8H4hPsXJJbIo5auPWwxU4DJmR0kei+dkRoj05s+c6wqu4PNyMeFwSZa
         nTz2TMsM7HJd52YhsBjx1nlPLRAbYdv54I1pmcbVN/ss/5E0SysC2wayKv7x9KeasF4H
         xJKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvHWIGXcbKN/a6hVnN5PJjXqVI4gbCYk20xe+wviT8DpyvzSk6Q3iXk8Sbbk4tSs4VxR8MX7SmIixPg9OZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzGr2/+44WEJN8QvSPnJXpBWlCv/oMnvXPLkO5lKB/5AJkB2GP9
	DefZNKY0wlOOsvBzM7pBU1WlSAC5Mw2hIGpHTAnhdZqS1rUn6EFoaoHADShrKEtXppk4FvR2wj+
	r5onOsGWhlep6n05po/QouPrDxe7T00UAY9oG0/XQj+kYZ5qRgVWde8YUYKuf61GEui9t9Fh/Qu
	zxJxnIzUzq6Zv8HXfkrJGI5cOUVKG7j0UAPorgi5+arZs=
X-Gm-Gg: ATEYQzzEA/EZOJmRkU8nEmsjY8rKzQN1b+OUahxqA0/6JKyO7GKa06PBL3mvpFOTGMw
	1qNOjQUEQPUJD3y4zX3mHEedMgcMLLLQ/p7USeQQEJZGkSCrXrR4NkBHw+7L7fn9sEHhvcOrfJm
	W1gRefbDIt03n/J1iofsAv+OCcIEvMFgvTVNGx0bPqczuPT8qDLM48MUXpAcjLdcpc6F7HuwQGo
	cat30U=
X-Received: by 2002:a0c:ff49:0:b0:895:4bec:c629 with SMTP id 6a1803df08f44-89cc4b09c00mr80035306d6.31.1774525364564;
        Thu, 26 Mar 2026 04:42:44 -0700 (PDT)
X-Received: by 2002:a0c:ff49:0:b0:895:4bec:c629 with SMTP id
 6a1803df08f44-89cc4b09c00mr80035026d6.31.1774525364127; Thu, 26 Mar 2026
 04:42:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318040644.3591478-1-swati.agarwal@oss.qualcomm.com>
 <20260318040644.3591478-2-swati.agarwal@oss.qualcomm.com> <20260318-devious-spider-of-endurance-ede46f@quoll>
 <CAHz4bYsUAojfB3BCHVoc8PMQBrjme6grdEnkxu7KhTQ+sxOf0A@mail.gmail.com> <0e88f413-82c4-4986-9d9c-122e0b0377b1@kernel.org>
In-Reply-To: <0e88f413-82c4-4986-9d9c-122e0b0377b1@kernel.org>
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 17:12:33 +0530
X-Gm-Features: AQROBzCVc_oNC_sU_oC_61KpntoUnrA8I1UPJ75_lQ-xCRorf2C4iC8lBXyBl_Y
Message-ID: <CAHz4bYvNFw1opNV3EDYaPbvA43KwY560afhHJrB_VELyfc8Vpg@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] dt-bindings: usb: Add binding for Genesys Logic
 GL3590 hub
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        Matthias Kaehlcke <mka@chromium.org>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Pin-yen Lin <treapking@chromium.org>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        =?UTF-8?B?SiAuIE5ldXNjaMOkZmVy?= <j.ne@posteo.net>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=e7cLiKp/ c=1 sm=1 tr=0 ts=69c51bb5 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=3iSX5NBQDq5eyQkNaboA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: M7uTs0Qa1YOduPAUU46Mrnx5DYnI7107
X-Proofpoint-ORIG-GUID: M7uTs0Qa1YOduPAUU46Mrnx5DYnI7107
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA4MSBTYWx0ZWRfX5brUOPoecAsE
 fQ7fWJO0fAeU6fHP+xtRkcr+cM3Ikvm8IYem5JgJov6d0ryRShPLYRynY73p+E0UsuJJtuI0JmD
 TxhDFMt52tWiifD25+CD19PzgPWUWB6Ix+q7t5kRfY5gDzu4z7BFSh63U422UuRh4Qeu6Mayq4R
 4sPLu2vWYxUbMbiPBFMeebNHcvY4nvljrQ5DlkiFTcNPfvce1zYaJACWzyjADWUOKugTgu/BUfL
 da8CRahXRBmi2K8ngdjHzCN9hBjMBdYOb20kzgs38E3vlyj7TjcVGcxwpCPY9G5yPaTuvbmUo3j
 IiGhvhnMk8VW6rNr4QZULE7DV6DaCIThpgifwM8/WMsO861Op+RbBBtjT1+4gAi63KBUfCXTcs8
 JvsLaCNQDofBWZ+W8z+zP0g0lHUmrxRWTL18hBJKs7jGB8+eqqIcZVHmJ83FXP09DXxurWNIjdg
 AwHRFcvOYkWv9qiV4bA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260081
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100107-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 8FF8D334B14
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 3:39=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 26/03/2026 11:07, Swati Agarwal wrote:
> > https://lore.kernel.org/all/20260121022449.GA1804139-robh@kernel.org/#t
>
> Exactly this comment is not implemented. v5 repeated it. I repeated now.
Hi Krysztof,
Are you trying to say, i should mark vdd12-supply false wherever
applicable but dont mark it as true and it should be by default
considered as true? Correct me if my understanding is wrong.

Regards,
Swati

