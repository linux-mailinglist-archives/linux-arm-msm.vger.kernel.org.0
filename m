Return-Path: <linux-arm-msm+bounces-99707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGpxHcC+wmmOlQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 17:41:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE54A319366
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 17:41:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF7923157B7C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 16:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 904693D2FFD;
	Tue, 24 Mar 2026 16:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SpROFtP2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gKsz1BPk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685EA3F23BB
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 16:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774369585; cv=none; b=h9eivRaVnxCQEnBwEst0KQL28Ff1tQJsmd1VpLKNBZ82CSluSjFNQRB0VWHqfGsXlco3M5oWT/+zwuPxxfArDMLc+uhp+uWSymTjBHnH0eP0Sf25nod9yKy/8C7arGR8x91mqXmuHf3M8x7HBfEQp90K3+/u9eTgjbpn2y8N654=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774369585; c=relaxed/simple;
	bh=6VWhj5fP/Vln8s/FmQfbs+SkMo/on860/XGuUju5JZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pJltY+OhpVeIYXIEy+L+1yzCcv/OYId+7wNWwF/vJrR/cXzsa686iKRD3a6GJxMEe1Pv9T1vTEJRD6fRqiyUIaM53QTrjQHOAeb1tpwLntDTx9rUj7IYJdHz8QqgqI9IS8rNxIloW2OsPIsxky5QIk9epZB/okfpIwHhMkDvtq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SpROFtP2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gKsz1BPk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OC5mHS409496
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 16:26:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qYMcGVL12sVLD6LswJRJjS62
	cG5yQyLOgBfgiqP9H9Y=; b=SpROFtP2onSZ6qFBxGVgW5Oh+EIZMBwNpmix5jLk
	eI767TcZ4HluH3fV1aXKidI3oG7+0q2M1PS9wztxaWRgHd4ZwHVcgQmvxW/rMm6E
	xrBF8V0qXMo7Ges7VlQ+eVF+0FhQxwvNzlCpgUIjDoX3L+EXp10d1IXecvKSAD+N
	BzEALPn2CqFZJdBs9zrYRKocUwgh/tU1vaZWAOOJ4leudpGV01kdw3q/LRbg4+rs
	YprmX4jaIkQfv/crcevpka6ukyADPBpgkqpeg3qR9N+/OwKIm9WZT6TS+7PaQzEt
	Wh+FnXEY5XRp2fPHyPpqC/2rpD8R6b6gJ4UUBPIyaIW06Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3nextaaf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 16:26:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5094741c1c1so86852531cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 09:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774369583; x=1774974383; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qYMcGVL12sVLD6LswJRJjS62cG5yQyLOgBfgiqP9H9Y=;
        b=gKsz1BPkWpZg0ecPOXbtASFG9cT/hNS3M9GdyhVGPgvmwFSvBU786bpfZ1JgaN5my0
         EbmRYuGlRbLTZ+BK3Sc8Vno29SJbrMD4D//88RN0Sl2wmSqzNst1sKnCmkqH1RCC7jaK
         Wa/+wMPQOoAner0Td+4LlY9/cFfxAnXVdXI21LgT+9Jzuy0gbGKiVNlNSjoORyWSZCUa
         aS+EhuBY3jKZB97PvAfckJMzTnJLXfYalstwe1QbNSp1o87vIgtMC9W+8vQwHX2M2YmH
         fUfHkFMDIVhcMle+Qjo4+7+Ds5eAlVG9XJe0tnhoMaiaoRYf/IwNNLYy6DMG2lgcshA9
         /xnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774369583; x=1774974383;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qYMcGVL12sVLD6LswJRJjS62cG5yQyLOgBfgiqP9H9Y=;
        b=A7b/d0CxVxgbDSqoQ0q63f47ZVwj/ASwrApjAd49y9t8KZNhI1j2sbLtF682Z8wqib
         KU8L5ZW4jLvlECksCYex77stcUJ1V1Prp1pttvGqooY/KCcvLcqaTnp95sIyD7uxq9ni
         c88ZWbH8xhATvykfG7wNg7gaNd6nVdsQITrCMVCImqX4F/dqrHQo4VQ7AUj7rye3EZNO
         /LFZGHkuU36JcC4wI1QbvMY7gaeEWoViOX8enCGQSRfX3x2q1MUdjhf7hoRSc6aFtW6d
         eWr3GcxViZn7f1+bZA4WdGdssdOAKtr0H1kEuyKt9Gt1p6rv+xO7B1bjxP7u/oUtWn4x
         8mKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWu81YVqLN2OFs+TjlygZhPgdHn4BF8QR7YlW4RoUGi0/hHm5AKoc5QFfQUs4ewVuTvsI7CIPis3gp5agUf@vger.kernel.org
X-Gm-Message-State: AOJu0YxXgva7AWJHQgUKn4lUp1PkQDcbqF8y1FwpQyIt1qpXpbN+AOVN
	fThj/CEwjomfYY5MaEUKcwdarqCck/jm68m1BOuo5qXVFnlrBKi1PSij1qNzAFbKofNjzMwLeus
	oWFfrh6qbCTLknnYxWox85WxVOnrMbDUrumJNGN3Yampiah2hJl4uVUJ4W4WMBtcqrBxR
X-Gm-Gg: ATEYQzwrNQcEh8zuLY+tij+LW7CpHAPJV9s4ExLsSksqkrdnBoMIA8xq4/FuWGm8vUy
	2pJrMMwNGSasnd9hmpai22+1QpAozXe24P5CwaqHYxJWpFRctnMIqxKn+hWtG1YQuyFY5gE2tMj
	4XscnQmCwfAlkrpDbhaaLsT33XJO3w9u8mAgQN66nyX2u6MQNXNUUzNSY5+AyszR2c7EUAPyOEM
	Xooe5LTwxkUQTk8cYHWN1e4qQ5Kx5yOW4wnoqmseNd42waRMLSYBWWgUzqz8dgsiBoD/l0uuDBH
	9Tbax9nupi3VKR8wHIGF7r8eXjTSP5nmr4mPLNdh/Os5MYrEOQVBAVxKdnQG7yfusGIpfIK4nyV
	7wFFHEG72AED0iCY6Gog9F2MlM6jzOtZa4A==
X-Received: by 2002:a05:622a:2285:b0:509:3141:312c with SMTP id d75a77b69052e-50b81b0f234mr18091cf.40.1774369582480;
        Tue, 24 Mar 2026 09:26:22 -0700 (PDT)
X-Received: by 2002:a05:622a:2285:b0:509:3141:312c with SMTP id d75a77b69052e-50b81b0f234mr17591cf.40.1774369581870;
        Tue, 24 Mar 2026 09:26:21 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644bdaf8sm44763958f8f.13.2026.03.24.09.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 09:26:20 -0700 (PDT)
Date: Tue, 24 Mar 2026 18:26:17 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] phy: qcom: qmp-pcie: Add Gen5 8-lanes mode for
 Glymur
Message-ID: <rtlki432tho35wzq6t252na52eaz4tqtembz7goqhble73aogt@wusxa6s3xjh3>
References: <20260323-glymur_gen5x8_phy_0323-v2-0-ce0fc07f0e52@oss.qualcomm.com>
 <20260323-glymur_gen5x8_phy_0323-v2-4-ce0fc07f0e52@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323-glymur_gen5x8_phy_0323-v2-4-ce0fc07f0e52@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEyOCBTYWx0ZWRfX28Fu/UA6agNe
 VnTKlhZ5oipRccM1TWODoG/K5dS54ai3w1cE4eDlTHqiMTyIF01vLvZxfna+9v+eAP/pYeNIzmR
 PUk1D4dQ189TKHEQAvzqfD7Ieojh4uloXx3J8xL+D/FYfLRds7bfe97E/tTMYVCOGJv1T87BVzf
 rTmNq3LYRhFHuDUNjKwRAio52BQVuyKJ+O+96qlSQNBPx9fgIEGGn5n6AjJsxHPW8dfK2nC+QM4
 8MrXlnkpYhkYmKFYo3Qn70HpRtDm8HBxpkXCekR5g6kKjiAsP/5cUwk7PvjeAeXpbei1CJXLWpe
 f4IpdpbrF1LDzWHW4Iem0YmdHvM2ILXHOyBWuMXxmUqMPL+bbEJXnBvL7JH7liYur86FoYPXicu
 SY85n1CpkFzHg3l1u1XVwl7IFYqoY3Y8ktO3Irnw963PwcT0vUAY8EfJrtiV2tTMDwE05XC8CdE
 WCxtvjo3YSSrGiusjIg==
X-Proofpoint-GUID: HNwsqPzyhtISbrSWfv-ryijQTH7Qj_Ao
X-Proofpoint-ORIG-GUID: HNwsqPzyhtISbrSWfv-ryijQTH7Qj_Ao
X-Authority-Analysis: v=2.4 cv=Bd/VE7t2 c=1 sm=1 tr=0 ts=69c2bb2f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=TM4ErUj_GH9VF2dpSNYA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240128
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99707-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CE54A319366
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-03-23 00:15:31, Qiang Yu wrote:
> The third PCIe controller on Glymur SoC supports 8-lane operation via
> bifurcation of two PHYs (each requires separate power domian, resets and
> aux clk).
> 
> Add dedicated reset/no_csr reset list ("phy_b", "phy_b_nocsr") and
> clock ("phy_b_aux") required for 8-lane operation. Introduce new
> glymur_qmp_gen5x8_pciephy_cfg configuration to enable PCIe Gen5 x8 mode.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

