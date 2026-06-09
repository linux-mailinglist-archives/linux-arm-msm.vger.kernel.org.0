Return-Path: <linux-arm-msm+bounces-112023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ECjZD+zAJ2pU1gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 09:29:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EB065D33F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 09:29:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dRAzBHgj;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QiWojqYl;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112023-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112023-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7680D301BC17
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 07:23:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 713F7231832;
	Tue,  9 Jun 2026 07:23:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44ABB38AC68
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 07:23:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780989836; cv=none; b=cAwPnAyWhj3/wvMXT84A+xZ7XWenEft1S4GBZ//YcfE/qSh5OplHww9TmybflNYeRkIXwBlUm45xZIZsi4zojyEHI8xz3RT+7MTNMdyTfQpc52I0qSfYH2t8N/nzfMjSR83t8zWZoR6lGNn61iDyDbG90l0gwM9fgvJpuxaLUy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780989836; c=relaxed/simple;
	bh=aylCzX4AQA8KEUVc1RlQbf8Mq6A9uSfbo/tNFCO09g4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O24RKXo/lv8n13N4camNXUvVTsrwzDWmSvPns1FoApBZR/l53vKBCOIeNfwzANziV27a/bI1sp3SeFRxKWCsPdH9P2XNh5K09a45Ze39+sXGCHsLecLUg/Eqn1sGdt5Zg3SrqNKExiEHytWw6aksiRhxOz4tqNyLupOckY3e+i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dRAzBHgj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QiWojqYl; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6596xmdZ1878524
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 07:23:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=26ctOLrG+LfjHtllnuTsf5tP
	cBJk7XWtRnEDq5KZ1vc=; b=dRAzBHgjI+X/qTcFzoUztqNcAfkx263QVP5Wzndw
	lRKaTtANeJbEYfIXHHTS6MYuvu8fXbkk9mASvntOzkxB2VeYShyUx3QYnxSaSf/g
	+dyNyB4e5PWOhJVf3vvnEZwpEPYPHzoNRi1Dpr2ZtbLHytu2rL+3opBMqx7jxUbk
	TJ2tj5pjV1oifggpLpwM1LFhDzCvqIX2SO7OuJ1H81wQ5Ycy03iiEySxoakcHjW6
	G0jKfKIMdenfrIkry0QTlwmd19Ho1jJfbiUljMlc70wXdRBBgUL9RW5kCYe6RA6z
	Dr1x0XzZCqoVYT6ODSg/eVJhV02FfcTP5dWTIUmV/PjVpQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epe25r3as-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 07:23:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51787404d3eso92864331cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 00:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780989834; x=1781594634; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=26ctOLrG+LfjHtllnuTsf5tPcBJk7XWtRnEDq5KZ1vc=;
        b=QiWojqYltT0bwtmne4/hjPw422uxCfrAX38HCeql3V2DUJL0dYNbY6LlAXxZU8neUv
         T55yB86hQpQ7i1/+R1lQ68LpDjkmivAi2angw6MO/nBrN8brsroxNyMQCwvcwfQJiLdd
         pQ0Y6zJa+hQmfJ/ix5/cLj4jUDpAARuYnhEA6JLnkbjS9t4ZgmBq5IpScFGmlyKleMy+
         73RUrEjyoibeo4uKPXZDE+XP7FImwuZxLqQW7H0agR666LZZilOQ8CYSwl/jxfF3mFbd
         LiW72TpihqHf5G9aqA1FKgPUfWAuQlxZvuLBzMKBmtZtrquGFJj2tP9c7DdPtdnlPK0S
         cACw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780989834; x=1781594634;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=26ctOLrG+LfjHtllnuTsf5tPcBJk7XWtRnEDq5KZ1vc=;
        b=UdiHX1SzW2VVGYG4XAJ842RfQXRPPFqQjQowTPmIcyJ+btDx8QS9zqilSsjpYeqXjS
         GA601KgDAtfIyVGf5gYIc2GOfkjpEmSjqJ4AIcNodsKm52Z1YtGgaW7CriBsqmoWGNbO
         TsUWGkSrggTMQez+bp5bm1Q6fPxslU8WDvVmNZ8BmbakeJyineiP/317cd1IJ14SxUTS
         gMV/9NLV8dcOr/orQwG4mD2Tg6bS+gIokglQPsnDBvrCFoPo7GdDrYieRoNRvOePksEa
         HBwLX9pREsojprnrM7Z4Nh2oeHqyEee+6wE7YMRqR2qmrG3Ckgfz1/3lan8BY4Kk8zm0
         3maQ==
X-Forwarded-Encrypted: i=1; AFNElJ8TCaT/fRojG8hUq1uf93ozGcEnmBSStpM+eeykfZ9N9AFFY0AcCU1nwzejA5Mj1z99tcGKtm4yJw1aH6h4@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhl5jOMdX5MXfvSCm5rCLYLnXQ0T5MDhwDoFZQGXHaCa2VG1ND
	VkwCsnI1d7OCGaK8N7iW313z7jUJAgz4KG6toZ67ln5OTDHpISDR+TNxu8+QDfrc9wSq5ZBu4zo
	7x0ZGwe95VLTa7EhrynCcNh5TlCO4sncriDlh65yUHaSHCQ41K9EIOLAp5b0BtWL54VXN
X-Gm-Gg: Acq92OFzTmD/zmQud3g8Pl3RS59LzUD4F48xlgMgBLMHCBc5L610LaoNL7uMTMIEtqG
	QucBopKWEPRPT1c70D2O6ExILsvYenu2rKCoOBX9y6SD/DBIKaeMshf3HYnvR9v6KqoX+aVs2/q
	9otwQ5zmESLzfmUm/xszC/4oCKNN2uf5Hq2KVRq4Wfk7Win98e1qxAbhVKgx0d4Onvy7WbfU0Ea
	qy8u2+qmERBXd0vhTcq+1YOeulL3EpZA26gR1zFcpBlKXSqUnxFgaObDyXR5GA6n7fQI7Ijsdfn
	2zJMHm9dvNQMzF07JtTad7tdpfesjb7Rn1jAO7Hc8apF5kVv0k2Q5dgu0CUtNIHm8z9zaNBmdRF
	YbCumAIjLq8NWJw2UEItzhbrhwsie18ionMo0QXrQIlc=
X-Received: by 2002:a05:622a:4e85:b0:517:5e32:f3b6 with SMTP id d75a77b69052e-51795a24229mr240024761cf.24.1780989833531;
        Tue, 09 Jun 2026 00:23:53 -0700 (PDT)
X-Received: by 2002:a05:622a:4e85:b0:517:5e32:f3b6 with SMTP id d75a77b69052e-51795a24229mr240024491cf.24.1780989832986;
        Tue, 09 Jun 2026 00:23:52 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.7.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f351ac0sm106947297f8f.27.2026.06.09.00.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 00:23:52 -0700 (PDT)
Date: Tue, 9 Jun 2026 10:23:50 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 4/4] firmware: qcom: scm: Allow QSEECOM on Yoga Slim 7x
 Gen11
Message-ID: <iuxorxt5vp6nayxis4ec5n3qi2z3qlfpheaidqqj7ulshqt2b7@hrk2kf2vnqui>
References: <20260604-topic-yoga_submission-v1-0-57c70c23d0d6@oss.qualcomm.com>
 <20260604-topic-yoga_submission-v1-4-57c70c23d0d6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604-topic-yoga_submission-v1-4-57c70c23d0d6@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: bFvnZBlMKelJiGoWW47bjF1VgGPZOWMZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA2OCBTYWx0ZWRfXy3QPoNvkEgI9
 fDAVKykNc4qegHee0QVEF82o9TqQCAHTKHyek2T2k99bjKyPOAta189Mw4yBg51VqX92Kzat934
 L4Zf9wzHlnp3DgpT6oUArjK0F8ONeLqBKsMJMjF1J1vHw+v2aQYJRfClPHiNkrJ2RRMTSPcbgyn
 y6z43QvcjDHcQHs3n7Ej1R/8Svgt6qs1FZZTsosEJ4yraqkCzVdEuN4McK8HrL+vem5S742NXn2
 jgYAUvIApQcC9ym7z1ETeG8SBy4D7vJtua3K9iq3tU2MAojvUMs7n2UDU9YJx+CYv9KQZpUblfY
 YOACSG+pLu2GqFbUpjH4t+4qs0jDsaP24XoMUmcqKWFDZAkmAOYmjpKNe5Q9HiAy+qVq5Uzxchl
 MIgrjzeVgM+v9LdBH+cTVcnS0iiFokIJ2xJ2fkBBtCbHufIzLpgIW+NPMBS7xGPIavDuWgHWT16
 r9CQ9DJf/rZn+k21Tig==
X-Proofpoint-GUID: bFvnZBlMKelJiGoWW47bjF1VgGPZOWMZ
X-Authority-Analysis: v=2.4 cv=LoqiDHdc c=1 sm=1 tr=0 ts=6a27bf8a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=BSZ3G9h0/EKbgBlQZBbU/w==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=RNZNEj0NQT9gpfWmR7IA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090068
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112023-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dianders@chromium.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,chromium.org,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 91EB065D33F

On 26-06-04 10:06:57, Konrad Dybcio wrote:
> Allow the use of QSEECOM on the Glymur-based Lenovo Yoga Slim 7x Gen11,
> as there seem to be no issues with the firmware that would mandate
> disabling it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

