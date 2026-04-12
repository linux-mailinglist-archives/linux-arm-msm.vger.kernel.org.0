Return-Path: <linux-arm-msm+bounces-102861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id VbzeIPzR22m7HAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 19:10:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E223E5024
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 19:10:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 680F930075E2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 17:10:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFC963009D4;
	Sun, 12 Apr 2026 17:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QDp8qcIe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HNEdvZCx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA112BE7CD
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Apr 2026 17:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776013816; cv=none; b=kBs2KGZBX41xN5OvFLXpAvxS3oZSrxMcpWIO0QZanuqKIL/OKoXOaG7emfIiaZD1swLo53dNi2o8Qw702r2adgNU/gdG4iGvFHtoHle8IMNaS/OVHycHKNCbctpSKMjOyCpETkFIJfe04unjzn86+9DQUK66w2fkIpPEYRDm0g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776013816; c=relaxed/simple;
	bh=7F/77yW4CDMAwOZp3eERP8K4l2ouAqLz+cjdMwkPOCI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N0SWdIcTPhL86jUOvwlVBpXEEcV0WLqODLcJm2mTSQy8SB8rjLN9EGwsNuTDjS+wM7SfMobByEqorXbW/s8YCRq1ybQlXYIZX3x4prBzAWUKiXt60UXlyPkHPSGBMwR7zgPSyhrMG2+/OC+c4wUZCsNJKl3h6u1QSaXjovyrV3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QDp8qcIe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HNEdvZCx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63CE5jEd533404
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Apr 2026 17:10:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ssHb3cZNSYp48eK2M4UtQCoJ
	dgaqvzLMI4+qxv/Q2Os=; b=QDp8qcIeJ/n93bAPX9cn3ALs5ZVssaaHVjkHFQz9
	i5q5GTaXb4s2nRteoCFg1X4J+rKwTH/Q3yGXYTTInoAl/wFyoDSCOwAPAFqGEa/D
	52L/gT1rf8mDIlRkgGQthNPiITvbfyil/QFjDf8zEkIV1GEMKUkJPV5zXX4rmzeD
	7r6yIeckWq5rU/2zGVj2QujAGCOU/Qd2TGjl3tTuwEidJQg95P2ntsZY2Z9bLIUt
	2PGALLVSYbOP/0yKQfGNVjl7qjAZa22k5ZoSvjbC/v0NGrhUTHcGCjEScYmn56t9
	3hv5XOFe9zveTSvpxYbHx8rTsljYJsQHN4zBHpNZ+TdGFw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dff2baq3v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Apr 2026 17:10:15 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d5d1c2289so28562401cf.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Apr 2026 10:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776013814; x=1776618614; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ssHb3cZNSYp48eK2M4UtQCoJdgaqvzLMI4+qxv/Q2Os=;
        b=HNEdvZCxQu3Rgr2K/KoXn8SSBtgZelQO16LrXpqB/UR5NNxp+kXiqPlkqBilQJuURK
         LxBnDC89ygrr2L2kTr0wQeKj+BU/7CZ2b9BEKAhLadfQfBs+oLlZLrLNl9HmbrS4LRpP
         GGiB1jYlx8ZNUpthEQw7BL/QL9HCFhrwV3LBstpfy0DIwH7MJ1SJWcQ6xaSsteaIYCRP
         uW0g0YpEU52dAaZEPm42xXRjhzrDQPejmjuP/VkrBDxOYt7BGuQo6L/9xUHlg6KBMycj
         FQ4IxVuCG9VwDc6eAWiwSAfjbBjATXX1ZRUiD9RSMoHNeApMx6+I0G1QQgnD4BSpK+mG
         c8UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776013814; x=1776618614;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ssHb3cZNSYp48eK2M4UtQCoJdgaqvzLMI4+qxv/Q2Os=;
        b=jOrODLrU8ng70a5EI+Yd/NSk3eNcK0JRTCOEgEB1uCyp+46S3qI321S7rXmKdHO4lv
         +ffOTTc9QoVSzE8gceq2RcJqsNh07p//U9zqbPCW56LS3gS9bBLNoRXEX/Wg23CYF4qg
         n+ZOTNXdApGv/eZO87dHnp1dNsT3dxo5SHDRAcARQyJJDq4yAIdk6xd5yrOyvvieL/EE
         mZiagM4b8+rnnHYTJOwNWO9c+QCzWMkdh5SY2eOF32vIncvfwxmVKZCqrLiQiT8grdSD
         KzjNxmU0VSkJVFGiWKK2cMUcBOsTHBRYt3plGhFop7/WeHM0vjhEk3RU49aHRfnIdQ0t
         6sDw==
X-Forwarded-Encrypted: i=1; AJvYcCXFcEx+wwePyV6koaYMiBhTYkhwDwKUQbiEgbMjcgV5Qcj5l0bgn/9dLSunN2q2v6G7vDL6KtVfWQ+lJV56@vger.kernel.org
X-Gm-Message-State: AOJu0YxuMGUUz1dmg6q48c/J5lS5KHemekC/VqznosbHU601tO6HXb1Q
	topCrZrAXlXONGAEJiVIXVZJmCBtxjCVbJk+YPsLvXkCseaI86sqEeK2ejDmSKKlDSr19vc3lU1
	fW9r94DFilG3avrO9rKdDZjsqFy2wgROdjVPUUiGl636OuE9xX8NmtoLghJUmXjfg6jXu
X-Gm-Gg: AeBDiet0V5xNUKglyz7jeCLkGloC1Ar5XI2i7YaDbm8OC7Ow3A8WRmFNg0CllCsr676
	JPwja9JfaTlfgYwFO3+PTitDraJVelGM4Zks6WvO2dBmyElIa4pivBZ4VzamiRg7wrZtsqWk/DK
	H/UBMtctnnBL1jUEsdlszcQwXheEzTfWZyEhImn8Rku20xHSCgL115Zr9zuF0zpx9QrY4PxXeAc
	Ry4odsojkorN47QDXUPGfl1tcyxcl3CfhKXAgTxK9zChzj6IPl/roVRdYv8M4Qakc3tWMK04c2C
	VUhp9dWejsJ+W9ouQ4mJCeS5r9ZjKIJyP9AyvkjaPg066r1KyebXkutoQRCV4IHlPCrNOvzAAte
	HDmCEd+LiJG7t62iDavdgGIwtpKZlcGtmenDJkG3IzswZUUpm5aXC2E9uYu7RH21gBkTQmRlsAJ
	XNurRuOEsrh2C5sGe18TrhTzzQ9VrqjkDjWQg=
X-Received: by 2002:a05:622a:d01:b0:50d:9175:34e0 with SMTP id d75a77b69052e-50dd5bab1e4mr151291211cf.40.1776013814029;
        Sun, 12 Apr 2026 10:10:14 -0700 (PDT)
X-Received: by 2002:a05:622a:d01:b0:50d:9175:34e0 with SMTP id d75a77b69052e-50dd5bab1e4mr151290731cf.40.1776013813635;
        Sun, 12 Apr 2026 10:10:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e4929a0a5sm18870291fa.14.2026.04.12.10.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 10:10:12 -0700 (PDT)
Date: Sun, 12 Apr 2026 20:10:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] Revert "clk: qcom: rpmh: make clkaN optional"
Message-ID: <rxjdw5cc3zn3d65md7ebztk55rmziifqxlctvn7ptfqmt32zls@cy3j3tkfpr5w>
References: <20260412-clk-rpmh-vrm-opt-v1-0-37c890c420ff@pm.me>
 <20260412-clk-rpmh-vrm-opt-v1-1-37c890c420ff@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260412-clk-rpmh-vrm-opt-v1-1-37c890c420ff@pm.me>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEyMDE2NyBTYWx0ZWRfX0/uXX2D++lxm
 Dn2wdEoJltqnuVh1AB9aO9jbSj9EJ+aazOcEZyTw9gkhynY9rzQ8B9XgWKgHpe6hCLgXqiZ6rEX
 d706aJCsATTJevfQeOkAdaphi2nyvCf7PsEuad7l/vHHk1Vrc8xCku8QyZUXL+Oqm0xMeW9rm9J
 39gNr5a7CitjO/XfhWm46iH8cV2qFTbcK7srdUJmAkyJXbtBecTBIHn1K8FRFacxbdyOa/DCPLP
 GFtHl43yp0EbtypMBqC6h0KC64NOHG75ZUayZDc6h3LstIWFTYSweSdGAfzYpSRzcsIZmIrV8Pj
 0QDuX9G3hTOfKMojKSZ0zy7xEMLXkvnVnIqdzO/mogqZcPP3xbyh1f1KB3Tq0ee8GlZ4Q+y3t0G
 XRvbS6HRDX++HkQXxbzaOLDgzhHWzIeG++EXUJyEdIf7oPWJtVhr6UhcugWeCJdZd/L5KKUEK8W
 400Gc1zDYa0jk8o3LTw==
X-Proofpoint-GUID: DpozR_o-oQLfGPA48Jf8k9lsqCh96dtw
X-Proofpoint-ORIG-GUID: DpozR_o-oQLfGPA48Jf8k9lsqCh96dtw
X-Authority-Analysis: v=2.4 cv=W4gIkxWk c=1 sm=1 tr=0 ts=69dbd1f7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=LHHdHzVBj1RI9S9w2dkA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-12_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604120167
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102861-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C7E223E5024
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Apr 12, 2026 at 03:30:52PM +0000, Alexander Koskovich wrote:
> This reverts commit 166e65bc6ce317be41368d9340b870edbdbaa2aa.
> 
> Reason for revert: Better handled by just marking all VRMs as optional,
> instead of needing to mark for each platform, done in follow up change.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 11 -----------
>  1 file changed, 11 deletions(-)
> 

If this gets landed, then between this and the next commit the tree
becomes broken, which is not nice if you ever try running git bisect.
Either squash both commits together or change the order, so that the
affected VRMs are first marked as optional and then you drop the
clkaN_optional handling.

-- 
With best wishes
Dmitry

