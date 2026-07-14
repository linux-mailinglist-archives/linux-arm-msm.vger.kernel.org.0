Return-Path: <linux-arm-msm+bounces-119042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id D5HHDMI6Vmpv1wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 15:33:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7897C755300
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 15:33:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=AVdTzuh1;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZT+wU6x5;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119042-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119042-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 68FD531B4554
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 13:25:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F46630DECE;
	Tue, 14 Jul 2026 13:25:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C128830D40F
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 13:25:28 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784035529; cv=pass; b=JHFu0M8wO13RAsaRBLrjP7Vbg851FmIsZlmHFae9DHK/SDTwS54uqPC1ew5J5tYYFIFR5IsD4/vyf87doel0utddHGdKDGYixeRLyU6E4uZcJ9okYxcb1nqctLiteWCjvsyT4nKYfpAw+v8yUiqi/Oo0fUMXvK/Pk/jLSaMZzBA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784035529; c=relaxed/simple;
	bh=rLSggp2eUkqKcIaTvCONJutqZHOTM3brSlJWBuU6ap0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OMrw1bnqx3jPWSUygmUGxgQbOOq/RNhWn7uwwbKdvEuaUSrvq3+H7QDuucT2jb/nK81XN9SEkkYdYWeQBvMmEGWVyGzdkobO9kEHZ07FcHlyyA/+L3zzySX4mz/zi1SqF4tyN4eD2V61YXN0Bu6oaUki1qdhBVmCpFVFEZQf/A4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AVdTzuh1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZT+wU6x5; arc=pass smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ED4ObH457565
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 13:25:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VbTxOFxRmNPXWOgdzXkJ0cWq/pvxJY6EaAsakMhM4E0=; b=AVdTzuh1ViIoC+wp
	2YSaTJ2eh5i0sSinI9G6G1X+8RQ+EMEJbhFSv3E9vcOpr2I1idWb6q/2L+5jZdvL
	efOgii/XEEXLhDcQPV2JzXc+46CgevtIovPOc8EIktXSpwiHpTa0rEIYVVE1/0iF
	FgnpHiQl42+0R0x5WvaFluSJEANuFaBeV8rPjsKYmSsy7wsGL9rBjCaEXHD2KtQF
	/0rQ2aE0ZVd7hJPoZgnWmoMznNzejxMdKqCEZxZj42Uxbm5ABPsNtaoWDjeLgv5O
	EG/fQH01O3RoJZHlP84f9CLV1jFCdTYecp+CUyFVdYIgQinI65hm89f2WROma/nb
	bTw/qQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnp0g3hf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 13:25:27 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-904dac0f77fso60262616d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 06:25:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784035527; cv=none;
        d=google.com; s=arc-20260327;
        b=Pje0BCwyHjb5Z6vLpfaFaqbLhg6GTMcNkBIjDor+oHgrUvzCNkzaq2AmP9wyqRWP+v
         aYXqtNt75bNMWhxxSxsWRaiBoOv9r0dqfsCY2a0UjCxXLc7qnTtV2SChiLkPJdQJo9Et
         JeoRpYs+92HdnAFwX4nkgwpHLDu3AzbrlStJBxUL+zZ4FTX/IWH6w1stdS8vUMf5CFQq
         vH8l7Rr76z+eyhK1I/Oxdco/UTSLghZUytCjGaRIwdUEFjodV3gdPCEdmDdpQOIwEw3B
         4a04NpFE2NnssE/kPaFxgjEprJ3GEz1EsixRCUSHMolezTmQq4tO300yrsAufoSCFCWb
         /gIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VbTxOFxRmNPXWOgdzXkJ0cWq/pvxJY6EaAsakMhM4E0=;
        fh=T192wYbp1+3KFmzNboR8086Ln9qiyLk8OP3dRBdBltI=;
        b=Z9TqmXKpEc9AE54VUEwDHrOKySAtPeNXJsZWwqKLYvHLRgGg8HawVq3AbIw7jHx7jd
         8Yjzw6BcMTwxqbbvlzoWTfhYUfOcjxAIioEhaV80o0tN0J4DpyAwqnpsI9wuqIhD1/Rg
         I0xpNa2lJ1m1zj17ymO4Ej1KGdPI9tU4JrpKQ91P4N/Tec1psXPdTVHZ767yj4Y5L5NI
         2ZKCQuJpBTC0ZXntWWCZ9HZjfQ4PkCm0YP0PiXFuAp+RWd0iGCovtiyhiJlhGRkgE52Z
         z6bTcJHPw+4t7Y89NpHe2KnXBndzLWsEUT7b5tzD6gbdngBjCZfjVe6k9+w0tsZHzTdU
         DtfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784035527; x=1784640327; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VbTxOFxRmNPXWOgdzXkJ0cWq/pvxJY6EaAsakMhM4E0=;
        b=ZT+wU6x5N//e0U24MuE3u7KN9OtuBvA1JJh9GdAun1xJkavYGKI4YH+pMjzhbFNZY4
         YdvZlcEufFX52AO3IXfKfI9yRhFc+jiPw+cryYjH2YttoxrHY/1yP2tiLjeDBTiwzFeX
         YRXlBPbO/h22JK9alawgFmoan6b11r/dX6PHCkKerz6eX+sWCC1pcHM+vZBJc3Cx3DYX
         riRCV4sqC8MrcktR/yADcG1gM1DrN/XZba/GXfiBBxWjaGpS1fYLeWzD4UjElUijCdGp
         8/fg+6cGLG2Xns3MmmjnE735UfJ2LNGdPodD4Zk9ga8YJGmmibofWeZ02zOvLlRfMn3v
         /0sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784035527; x=1784640327;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VbTxOFxRmNPXWOgdzXkJ0cWq/pvxJY6EaAsakMhM4E0=;
        b=I017402JTnKpmlTetub7++jaiN7V88k5IFNzsgsC+03F2xtfZMPxix5HwEPbjwnFmo
         iTgLK3UwCvlFBtNk9x9AcP5l4IxpFrPHa70vFnETFLD/4nDvhIzhmU4xv43ucVIgXwKn
         LBc7A+mlIWsB7MSHKKQku26TCVWVh/uKG5r7h8jCWlRgdoN55100mBNBzFc4g+zXLV6V
         UFqb1xtQ6EV7R7ZgsbuBleWlGnQJ/uSlgyOhpOkaxNsMYNEb9xvdVNEX1kXqRmvAlLPp
         s939HHs8hnMQrg9/abAKwnAwGp4jDbsYOvOF8oQtHBMIlOh6iCwk0H+kJ7dzI/toPK5V
         hpOA==
X-Gm-Message-State: AOJu0Yw7mxqd1ztI93gidIPn8UaJ+D7E2A8Vl8DKJETMiFhZRCY/HW+E
	GStZBexz5WEciGIdwIRRVeQPK0RuMvVFlNaqDUHMjCNIjcOgYte32ilESVvdHphripuvJJlrDjn
	huZF0weioaKy/uvYiXUJhb/fASQY6WLx/EdGsDJgBZE4R4K39+cuSOnIdOZ4l2ufBuJA8EPDRLE
	4NK3oi69DO5nSa6tc0mBrQeiJidjRUey9mPyznrssV1Wk=
X-Gm-Gg: AfdE7cl05ho24LpmwDUGGO4qfoZZM5q3qYW0EyiG4q5cKGu03mifpK8mTNdwD1T7LBn
	+8vddKIulwkTMknK/0JiEnAE+bHC4p5kbDJS51YkM00UAzlmKRpmhUMpuP8WBinZjnykCfjp3BV
	bfZvBzSTwS7pKG8vPeOWdENSd+xb5dSEgAwJf4kbynCXJU7WfIP4DhZRPp3Xqp5wh6VbNv
X-Received: by 2002:a05:6214:568c:b0:8ff:6bbc:2a98 with SMTP id 6a1803df08f44-9074c8750c9mr24791036d6.46.1784035526800;
        Tue, 14 Jul 2026 06:25:26 -0700 (PDT)
X-Received: by 2002:a05:6214:568c:b0:8ff:6bbc:2a98 with SMTP id
 6a1803df08f44-9074c8750c9mr24790506d6.46.1784035526278; Tue, 14 Jul 2026
 06:25:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609-maili-rpmhpd-v1-1-c8f976377726@oss.qualcomm.com>
In-Reply-To: <20260609-maili-rpmhpd-v1-1-c8f976377726@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 15:25:14 +0200
X-Gm-Features: AUfX_mwsngLHPC3uNhTR1Jz46GGi6nXVr1OBeKflq1cTrdVsPhj8ExhimAtbCLA
Message-ID: <CAPx+jO9xy1MO3dygybG9Z6benAC83rah4XbL1QHDDEtgGFYYaQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: power: qcom,rpmpd: document RPMh power
 domain for Maili
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEzOSBTYWx0ZWRfX2ZERrQYjoKfl
 OZuiUfVXiqdNME54UgEz0QSbLWncH0E3gfJ9iBQ0NLBDqXzjbIVQyH+2Bn9FlOvc1J3vYZjZ4xX
 u6WBAtfOtVZrmtvbjft78NcTkbnnHLc=
X-Proofpoint-GUID: rYgK_CV-hT5i1fQyZCJDxIm1avTElXzr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEzOSBTYWx0ZWRfX31gW8PZb3m4y
 Q8NSXLrrzRoD4FMRu2lap2he2aEg6Fu2yRHwCtL1hc4kWP0QPDJSyK3H4K0a++E36xkkPFezQCX
 HLp94EoTxxZ/IxZDcCCd/IQDjiDv3datYYRNEFxLljiwn09v28/aEJLY8+lh4pVH2EF2qFawYpc
 p6yM3a6fWQfEivmtbPIALIin0XNhFr5XsFSNlWQRHquIFFhG5Of3LzvYegqdMPCv98Eep+0gv9N
 2P6MN85+HH6RA6qMVKpje5PaH4szTn6Z6GHnh/WhWVLZ8qQ/GPSdIt3arz0yXNVCgKLOZUHkfll
 ok1q6Bq9GYTBmu1dUoflO/3+FKQM511ZpttH4M5PSkKJbpsI68aJnU7EHw7taaAvO+FVtFLRSpg
 6jPjNG4qfAdwtl3VzoqKHQ8E8v+jfj06dpdCV6OzAGW4mt5nEWgk6AoEskA/rR4WlhcMs15WpqR
 NRCWTbyZdVN1EpfeIug==
X-Authority-Analysis: v=2.4 cv=FtM1OWrq c=1 sm=1 tr=0 ts=6a5638c7 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=cK4A6gYifi5ys9ctsdcA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: rYgK_CV-hT5i1fQyZCJDxIm1avTElXzr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140139
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-119042-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:fenglin.wu@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[ulf.hansson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ulf.hansson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,mail.gmail.com:mid,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7897C755300

On Wed, Jun 10, 2026 at 7:43=E2=80=AFAM Fenglin Wu <fenglin.wu@oss.qualcomm=
.com> wrote:
>
> Qualcomm Maili SoC has exactly the same RPMh power domains as Qualcomm
> Hawi SoC. Add "qcom,maili-rpmhpd" string as a compatible entry for
> "qcom,hawi-rpmhpd".
>
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Do=
cumentation/devicetree/bindings/power/qcom,rpmpd.yaml
> index 0bf1e13a9964..9f3c8cbe9d72 100644
> --- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> +++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> @@ -73,6 +73,10 @@ properties:
>            - enum:
>                - qcom,msm8937-rpmpd
>            - const: qcom,msm8917-rpmpd
> +      - items:
> +          - enum:
> +              - qcom,maili-rpmhpd
> +          - const: qcom,hawi-rpmhpd
>
>    '#power-domain-cells':
>      const: 1
>
> ---
> base-commit: 3b7a18a34e8d3b14c7c926f033488a0350de9759
> change-id: 20260605-maili-rpmhpd-2079035fc51b
>
> Best regards,
> --
> Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>

