Return-Path: <linux-arm-msm+bounces-110581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIHjCp5xHWoCbAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 13:48:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9423461E93D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 13:48:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EF9B4303D367
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 11:47:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1021E349CD1;
	Mon,  1 Jun 2026 11:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GkcypWr1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RRa1eika"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FEF13644C6
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 11:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780314450; cv=pass; b=XO7JM0/zVOSxX98jOu0wxn8Ux9+qKpsfn7jhCO7hbc1d1NivjjtTKx72cb7dzZjk6rHuS+4AalA3BPHy26I72kC7n8FROjeZSrv6EpQw3xtIYVs6lcpMoFFlqchoPBQpZPdj5JK94f8MVh+dGOLd2fFeC9DOgRLX7Eo27z5TyOY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780314450; c=relaxed/simple;
	bh=fF4GQIj+h4QEV66Ie1KKtCnLCX6GrHlWzUyOV6OxElQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HOwQTIvpvsyui3fWln0vLXprfDtEl1BwHB1HvzK1fg6vu6+NBN6IrydhIlqS5IWZSwOqqK5v4hrhJXyyoSkO4BOl+CoGMkgBpc6BGyqWFyc9pZbIzAgVVgvRnCMWqMRFOvPYnpjA83YaOBXJvvnhg9Z8qZMKMpitn2datXvXPN4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GkcypWr1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RRa1eika; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6518dV6a3563643
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 11:47:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VvqGEC6ifzGkUuGzpUjIx8yhUVpMPtXehYqxllG6p/k=; b=GkcypWr1C92z7v1E
	1I7279dSLlvFBs1QztnbbnkrZpL8W3yW3LefP9ga3hBzApBOGKAc1tezdbLNvz3A
	DeIIwrZ5FV1ENsTDahaqxUUMfRH5RJDoI2Sa1m6jWlb9agkC5gusvDGzgYttjGJI
	ocoColh3GX4BcgeUOA35BnlLot2lt+Qb0e1oLiU53iVdglzkqeR9mowRbexZrDtp
	wxmrVii+N7iLtTO+vZcH7SQ6AM3KeQnvnzKc4mtlVrjyqKgCuG7+HKepy//28J91
	phM1Fiuw8voIUZqFqI9IKvueJq/8UdYmvCMmG6gK5+KtH9jjnc5eGfyn6C5S2/4l
	wf7Ocw==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6rxrsw9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 11:47:28 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7e2f76639dbso17559137b3.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 04:47:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780314448; cv=none;
        d=google.com; s=arc-20240605;
        b=XRn0JdxradlC03ZlSuRa2f99QKHzrkaU2p4x+LYPeJ9gIVpPzMmFKp24/AeSHuSLVw
         LxlMzVXdszwBB0ThRUu9vvhPkWrgDCmx9OVXwIMeY6+jtr5yegWJJcQuytywxkZEHUHw
         1hwqQ+3bT0sHijYVVPwMif7EHKP9ab7vcRnM2QxJxamLIsIObG8tCwXavTzsV76gmYlf
         P25p92v6HJ89Yp1UJer/MlWyf0tvUYv+Jcy9dWswDMMvApNjTvqxlpORXfsl6VwNaPtB
         XDUXsMN2tW9zJ0KS4LsUOdTHTYntX/RWGUtXzecqEA2udBc7cn5dkae7BTRjndoHp1PX
         jUbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VvqGEC6ifzGkUuGzpUjIx8yhUVpMPtXehYqxllG6p/k=;
        fh=ch6ZhLoGN3Cxjwv69uhgPSMCLIxkqZjM6T9MtGco/BY=;
        b=PPrDC5NStty3OR22FgRL+R+VAWnqDQKsqsjmv6POp/GcgHKF5XLQrHXmyUpS0hsza/
         PE41JtsiHrJNHOICm2emEqRPVk/yhjdDaOYjq1jl5Jg5q86c2w0rOxMgkC++dO7Fy5Cf
         1TJQFMKEIU5uZag8frqZbrps34vLcOP/C4LKq9+ArZkKguFzxA7D3FKq/HQoY1EmP6kW
         1uFVHkdymsGSa0bsJ6bdMT7N0ON8jVlBIz1gBgYOPVgcg42zgyQKDcwLvFD5RIhporl7
         345IBYdeGu84MCV1tC9L39W3l9+Yt1JX+xiy+RkXihB9JQRa2TbF1BhEKyJRmvTQSlKt
         Yf4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780314448; x=1780919248; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VvqGEC6ifzGkUuGzpUjIx8yhUVpMPtXehYqxllG6p/k=;
        b=RRa1eikalCMRfUvlz+pHuNCbrl918c6xtqUNKov3jbhP9PW+lET5URs6YsIhR3w762
         6Ui96SgNIP0Z8ffPSljSkdWJNuhA2RqWUwWqOL/Rw45bfgRC8U2aIZvL0fw2PwVwOWS5
         itlIo7f0Ej/vgfHDuh42eUnjGJjIYcktBpKXniyRj2fel6mlVt4uQK0ZwaTDoFJj+XGB
         IxxI8IhSYqqHoA38qTgsU9ibb8fkMEWumXbd6s2bATOATHvwgcOFE7Mfo9T9keQew1Uq
         fGjBU8tSxbD/We6DZ9wfEAkf4tZp78VoZmp27F+q3rjYbsu1kR132MkVpI5JG+E2GUGy
         4Rmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780314448; x=1780919248;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VvqGEC6ifzGkUuGzpUjIx8yhUVpMPtXehYqxllG6p/k=;
        b=mBFJ2a+I75csppGe5AAPQUIDdScqESWCnHoQ7sAUs84Q2HAD10++8MiRtAtMtJdTqy
         4w3eWQVm5GeCQhB/e1FHbnfgfwqmPIeNmidhR3DaQnmYJGelzUJ77Bc2yUDoOV7mPJnt
         lyv9Z2TFEmUq5Y9pWaE54h1Ddg5VwRVTlKt9+/HhP1INc0uAnaAFDjz1gmrWeEpZ04AM
         Y227GcublP6ELMaKptc31eGDg43t9kKiCMm8rhaR9Tl673vy082MoitoJKMjtYMp2iYn
         sE8rL6DvF+IUA041K0xRiRbtJ/zlRyoyPQPRoBdLpfpw0RsbEAsVZTQNL2MygaPzY4p3
         KTLQ==
X-Gm-Message-State: AOJu0Yx76XAjaJxv50vMxOm74wwtskH2VFOQXJSlx+FeCVjjfw4uTGjd
	tcPr0k+7D6i+Ds3hJtI2cnC/26Nak2bgKPI0MQhIqpVc/KJ4CdvlKetCkt5Nr6TicZP/O+/sTzO
	xdAnmPAVlw8erLGqTTJr1b+L2KA75AD/nIyyzk/DUKXcFpTJLv4d+SeqCTt4DMNmFMvjs0Pn4ib
	4xQTbUeut5JC2kZlXQWuZ45CzQGpFTm1I8IbIBTMIyk+Y=
X-Gm-Gg: Acq92OH1ma+QeZ8+l5xmRWgLl6YAW2gPxU2Yu1Nq0Fpaj2NJ5STSXNzm1P468/IVHho
	rOp5uJR0yDXJiWYa0/+OEtSdzLTKY1X4womYDdV3/kg3+R0xYccdAV/AprDWPJ0ATjeRtVqVGg9
	977jFjgCqVJbTgNqYZakzG+VOXcFrqFqB30JHckp9b7fHIzpkFQqp4A7U8CHk1DZU+5iw9hmb+R
	Fv2Hwm8an2ITMrVZA==
X-Received: by 2002:a05:690c:4443:b0:7bf:107b:f859 with SMTP id 00721157ae682-7e05bca9162mr99548407b3.16.1780314447747;
        Mon, 01 Jun 2026 04:47:27 -0700 (PDT)
X-Received: by 2002:a05:690c:4443:b0:7bf:107b:f859 with SMTP id
 00721157ae682-7e05bca9162mr99547967b3.16.1780314447242; Mon, 01 Jun 2026
 04:47:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260531071409.3557734-1-qian.zhang@oss.qualcomm.com> <vvnecdwfbpzeuo2zjk7ajkfwaay7dexjncjuuhiu5ldqlp62wp@ybhqbzzj6x2f>
In-Reply-To: <vvnecdwfbpzeuo2zjk7ajkfwaay7dexjncjuuhiu5ldqlp62wp@ybhqbzzj6x2f>
From: Qian Zhang <qian.zhang@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 19:46:49 +0800
X-Gm-Features: AVHnY4J1p8F5jsFZwifVV_h24EYqL4UGX7pK8oAqWncPXMIfn83MqsJ5ey2uRcg
Message-ID: <CALC2J1MXRygj9oRwEBsSPfhLjpRZi1T=_E14vkbOkGKKTCz7cQ@mail.gmail.com>
Subject: Re: [PATCH v4] arm64: dts: qcom: monaco-arduino-monza: Add QCNFA725B
 WiFi support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: QUihYT04Yu9CBWkll7T8fOvK3L8flcAW
X-Authority-Analysis: v=2.4 cv=dsfrzVg4 c=1 sm=1 tr=0 ts=6a1d7150 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=9GHLgsx_nEScqj7CA7cA:9 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDExNyBTYWx0ZWRfX1UPyOqButyV+
 ypAsvVbuZbona5waZ+0vO9RKEb5dir2CEowksBVSVThVFUIPLCC9/ggsjDENY/QzC0P1sUsG0vb
 Ecy+yZgSl/KaTFEg3Wk/m1bFUNM/s3DOV1yXt2VTXiQEXkjkcQAnn4ZAfIDyqsk4P2RsE2W1WN+
 go5bFfaoqDx31yrxQx+70JJOt6hpx4THt3Bo2+rk3IvilBGQiuaioU4yE+xSEGA1kRcPBK/43je
 y3yAdXsM5Dlw+NZgP37iV8Ms9ESkPWQ9zgEbRabOPm51eIR9TKxX3qtss8yURStXqd921ZpMa++
 gqiH14bfaNX4/Lci3cxUqb7fnn+Tjgh2DeqmysH34p6TAPGOa06FOhiniIQlO+Bq24sNk4DMyJR
 pC6JUPbqwFZQkahVhS90IsagaLcg84u4M49s+XzkecAqZc63A7upANED9ywBaH2ERkX1hlkC8bg
 b8ZjyI9DRgLqNW13Riw==
X-Proofpoint-ORIG-GUID: QUihYT04Yu9CBWkll7T8fOvK3L8flcAW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 adultscore=0 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010117
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110581-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qian.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,0.0.0.0:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 9423461E93D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, May 31, 2026 at 5:09=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sun, May 31, 2026 at 12:44:09PM +0530, Qian Zhang wrote:
> > Add support for the QCNFA725B M.2 WiFi module (WCN6855-based) connected
> > to PCIe0 on the Arduino VENTUNO Q board. The following DT nodes are
> > required:
> >
> > - qcom,wcn6855-pmu: manages GPIO56 (wlan_en) through the
> >   pwrseq-qcom-wcn power sequencer, and exposes the WCN6855 internal
> >   LDO regulators consumed by the wifi@0 node.
> >
> > - rfkill-gpio: exposes GPIO54 to the rfkill subsystem for RF state
> >   management.
>
> Instead of just providing a summary of the patch, write something
> useful. What is GPIO54, how does it control the RF, why is it rfkill?
>
Will update this
> >
> > - wifi@0: describes the WCN6855 endpoint on the PCI tree.
>
> Drop the useless parts. It's obvious from the patch. Try describing why,
> not what (yes, AIs are bad at it).
>
Sure
> >
> > Signed-off-by: Qian Zhang <qian.zhang@oss.qualcomm.com>
> > ---
> >  .../boot/dts/qcom/monaco-arduino-monza.dts    | 108 ++++++++++++++++++
> >  1 file changed, 108 insertions(+)
> >
> > The Arduino VENTUNO Q board uses a QCNFA725B M.2 PCIe WLAN module
>
> Is it just WLAN of WiFi/BT?
>
> > connected to PCIe0. Two GPIOs are required for proper WLAN operation:
> >
> > - GPIO56 (wlan_en): The WLAN module enable line
> > - GPIO54 (rfkill): The RF kill line
>
> This should have been a part of the commit message.
>
Will remove this to commit message
> >
> > Testing:
> > - WLAN module (QCNFA725B) successfully enumerated on PCIe after boot
> > - WiFi scan detects available networks
> > - rfkill block/unblock correctly toggles GPIO54
>
> Drop.
Ok
>
> >
> > Changes in v4:
> > - Replace regulator-fixed + vddpe-3v3-supply with qcom,wcn6855-pmu for
> >   GPIO56 (wlan_en) power sequencing
> > - Fix module name QCNFA765 -> QCNFA725B
> > - Link to v3: https://lore.kernel.org/all/20260511-linux-next-v3-1-3e22=
737e71eb@oss.qualcomm.com/
> >
> > Changes in v3:
> > - Replace regulator-fixed with rfkill-gpio for GPIO54 (rfkill)
> > - Reference wlan_en from PCIe node via vddpe-3v3-supply
> > - Fix subject prefix
> > - Link to v2 (wrongly named v1): https://lore.kernel.org/all/2026050105=
1918.1990713-1-qian.zhang@oss.qualcomm.com/
> >
> > Changes in v2:
> > - Clarified GPIO roles: GPIO54 for wlan_rf_kill, GPIO56 for wlan_en
> > - Improved commit message readability with bullet list format
> > - Link to v1 (wrongly named v0): https://lore.kernel.org/all/2026042503=
1712.3800662-1-qian.zhang@oss.qualcomm.com/
> >
> > diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/a=
rm64/boot/dts/qcom/monaco-arduino-monza.dts
> > index ca14f0ea4dae..bd5b8a161e7f 100644
> > --- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> > +++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> > @@ -153,6 +153,78 @@ vreg_nvme: regulator-3p3-m2 {
> >               enable-active-high;
> >               startup-delay-us =3D <20000>;
> >       };
> > +
> > +     rfkill-wlan {
> > +             compatible =3D "rfkill-gpio";
> > +             label =3D "wlan";
> > +             radio-type =3D "wlan";
> > +             shutdown-gpios =3D <&tlmm 54 GPIO_ACTIVE_HIGH>;
> > +
> > +             pinctrl-names =3D "default";
> > +             pinctrl-0 =3D <&wlrfkill_default_state>;
> > +     };
> > +
> > +     wcn6855-pmu {
> > +             compatible =3D "qcom,wcn6855-pmu";
> > +
> > +             pinctrl-names =3D "default";
> > +             pinctrl-0 =3D <&wlan_en_state>;
> > +
> > +             wlan-enable-gpios =3D <&tlmm 56 GPIO_ACTIVE_HIGH>;
>
> No bt-enable-gpios?
BT is enabled in node uart10
https://lore.kernel.org/all/20260429103537.1282497-1-shuai.zhang@oss.qualco=
mm.com/
>
> > +
> > +             vddio-supply    =3D <&vdc_3v3>;
>
> Please explain in the commit message why 0.9V, 1.3V and 1.9V pins are
> supplied by the 3.3V supply.
>
Sure
> > +             vddaon-supply   =3D <&vdc_3v3>;
> > +             vddpmu-supply   =3D <&vdc_3v3>;
> > +             vddpmumx-supply =3D <&vdc_3v3>;
> > +             vddpmucx-supply =3D <&vdc_3v3>;
> > +             vddrfa0p95-supply  =3D <&vdc_3v3>;
> > +             vddrfa1p3-supply   =3D <&vdc_3v3>;
> > +             vddrfa1p9-supply   =3D <&vdc_3v3>;
> > +             vddpcie1p3-supply  =3D <&vdc_3v3>;
> > +             vddpcie1p9-supply  =3D <&vdc_3v3>;
> > +
>
> --
> With best wishes
> Dmitry

