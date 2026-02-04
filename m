Return-Path: <linux-arm-msm+bounces-91746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFh7HpCdgmlgWwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 02:14:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA59E05D1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 02:14:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4449E308C249
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 01:12:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AFB924501B;
	Wed,  4 Feb 2026 01:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JXt+vWrl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aI6yyF3h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F0F23D7D4
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Feb 2026 01:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770167524; cv=none; b=uBtNqfaYG9LwEhAmOxo7OvlQeZJkwRWBsELcY4qqP0Ey3U7UzkR4czqJnv+l47m4ZVc4jqvrtaIUx7OjxLceOjEQ0JJALTDKRE96lBCYZP5zunCM0585/ur4P7LdjNgnWZqXRNpt+Kqgc65dtu1vruAdNbRaLhxmIRdWrHe6FuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770167524; c=relaxed/simple;
	bh=m6Ixx8jioqtx/I5aFM0EU2IZnm5koObyL3qPDXS92M8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eN4epleEQzHnRwSfUN42ZnaaNef3hvQVlNz8o3PlDne5IOLeYYYxRplSkph1/a4qeJbjosrIclTVlFio1xUrxPlEWchZ7Z5Jit5IttIu6+ZNEXoDw70r/loXxbPwPBxnh7+Mz1AxNhw8yxdarlapQO4s+xiEzYq3bkmGRqn4bao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JXt+vWrl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aI6yyF3h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613ImPmj3824326
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Feb 2026 01:12:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gYan9t9ix9amGizYtC+O0jvQ
	3aoS4QZw/J14ZuX2GWs=; b=JXt+vWrllgsVFB48GTr+5nVWq9ncCnJmDZGFIIIw
	InrNswE4WMZbFTS/sbDFH/depjzBcsJgbs94bxF6V1otnSg1zVTPy24BgS3CpP6c
	JjGTUUxCUKz+mYHy1EVCyk2t0i2Px6Yf7txpZnRNgBPnA7k2Vc57aRrjiQF7BHLH
	CwDu84zkPX4XaPKT/XBUOZG3+hbakinbAFIcPseawKkvCljciQ3Fb4R9XZ3vhHUH
	oPJhkXtqC7h+WAIAzOU0YIKQ1c75lkgvE9cwtb9VjukEjxIxhpllNcTIuhTIyb5e
	5mlTTJLsh9tzkjKdCWFE8iA+ZCV0ZXlI7+9/OD/Gz2CGVw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3g33jhmc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 01:12:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c71500f274so643618685a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 17:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770167521; x=1770772321; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gYan9t9ix9amGizYtC+O0jvQ3aoS4QZw/J14ZuX2GWs=;
        b=aI6yyF3hvM7dI4ZBLAvp+fi7IAvhnDn2yq+ajZ8gg2JwZ9z4tLlDLxj3XAucc7IxDM
         aQNbYMijI5fn6lLh1iIauD5QsubSIjQe0AuBc9OnjXn5fipt3fXLQs++cfcLK93dSiSg
         2bVlRYhs3coJjx16tAN9bCaiQ3ZCJVfZkWHvOX76PDiuwf/LHAYXfQzCTYcowCuB5ycu
         upFXq53rLesyLWs+u6tWqcYJIh5njppE/JM4iL0joe3BWMSvZyT/Wlk/NVKLLZJADjKv
         7uDBdEYvYV1upzYONcJjFlMr7IvAyc4FlwocmrIq3M3prPe/sz1Nwe/e51+AlbL6p0Pp
         QQSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770167521; x=1770772321;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gYan9t9ix9amGizYtC+O0jvQ3aoS4QZw/J14ZuX2GWs=;
        b=mvRHieNQ3C+o6cSk6gWu4Kye0BNVdM4R3XF7qoYlkpkMEcyrJ/ZWEc7PigVfaMLS89
         jzgmercJ7luUNydKVpLtUj6gc0CP1HMxCCrYtN5uPDRibh8dfc2vneXTKs+mRhxIY+hd
         DtsXd3vbUUHp69SM1uH7H8nHifjl3raliKp4dt9XNrQs1+ZLYY/z08pHTBpS4BTN8yvh
         aDrRxa6GKLcEeqIrEhU2inZ0jp+uOmK7NW3MuwhdM72++PVOBUmNNH3ecedkrF3cIty7
         gD+34zIr1vho5Ar5BEO3ZIohH61vMmpN1f4DaIDYJkDcGwabRlK0sVkrAt3WuMDDNjYk
         fnHw==
X-Forwarded-Encrypted: i=1; AJvYcCVPzS6AGPQSwZoayXfcXAjUcpm60TRLlxV73vuQMfwvdg4rSvnMO32T+5KOfiB04waNSSSBpChdR4SMFuDq@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk2PlutUKg5bCsAJtFl12F7XoCVCtb+x1K64MK/a5xE9ukDwFh
	fgfExx234qlnx933Hd2XnpTj/nPLb6OCBFo+qnwzFWKFI2JrASKqVaI+8H663b5DqijErVyUL53
	PIAh7CtNh/64VaoHveT91v4xNpsBtdjj01LzOJQJouJHSy9HEKGXqeMBSgWsXXGx9+gxh
X-Gm-Gg: AZuq6aLQAbC0z9Q906KUWv7/DkFseIaIp7TfvfkkGTJGupCQ2P4ziSY9zIq6mazdgH7
	T5xZyP4toMBo6LScHkbeN9z8rZ1QMWqbtjMEHWUDMDfSiMVpQwhmzW5WRuiv8GlOR95HycHg1wk
	lRDWGlgoS251q/SF55Pz9VuHX/CmiIyKBqrR3H7UvcK6G0Mb4vG2H400Gf+mtQk84RXc8raaCSA
	8IfYHlp7leZaU/EsY9YCzbctfXIXqATp8oJ1+7k2zBbraZcI/iKDiwAUel+VaciLDrsjYTD/dBX
	KjmnL5nlEFEoNBW1L/jXX2aix67dQzuQVUDnodE3C7XEbveLeOX0ix+ylQVgzJpu8/ys1CC7Np4
	VX/jISI33rMPIzdNHaAS+t9FA9iDOWEuF7ZY0gFXcfQtjzgGJ9L4C9TZ3Pp4TRsDKPS9JkNOR5t
	hE19k3WUM/4+XZELl8dK+mg+0=
X-Received: by 2002:a05:620a:4047:b0:8c6:a85a:5204 with SMTP id af79cd13be357-8ca2fa75badmr210592085a.88.1770167521295;
        Tue, 03 Feb 2026 17:12:01 -0800 (PST)
X-Received: by 2002:a05:620a:4047:b0:8c6:a85a:5204 with SMTP id af79cd13be357-8ca2fa75badmr210588485a.88.1770167520743;
        Tue, 03 Feb 2026 17:12:00 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e38830f3fsm262105e87.99.2026.02.03.17.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 17:11:58 -0800 (PST)
Date: Wed, 4 Feb 2026 03:11:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
Subject: Re: [PATCH 2/7] of: factor out of_map_id() code
Message-ID: <j6euiso3pcg7nvewscsfjkqyfl55ajxxybf2pib3622uontj2y@aqj4satyf7b7>
References: <20260126-kaanapali-iris-v1-0-e2646246bfc1@oss.qualcomm.com>
 <20260126-kaanapali-iris-v1-2-e2646246bfc1@oss.qualcomm.com>
 <47fbba15-6375-40fc-bd2c-8ebf2788837e@linaro.org>
 <7d1b5897-8f17-4213-b893-d99d96afef94@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d1b5897-8f17-4213-b893-d99d96afef94@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=afVsXBot c=1 sm=1 tr=0 ts=69829ce1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=RddZqcDqejFcRhvv_uwA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: vNhwmC9yqNISz77yYGUTcgGlH2QoqGw-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDAwNiBTYWx0ZWRfX7R74Dh94hmDE
 HUPj+uUKpsjto/qGr6eO3Q/RpaRrmnHNTCB/ONVP7roc1T8307b4004x0qzc1wLQuMGs9h9RBMF
 xCdi2gu7cBuTodDlO4p38VSwSnBAcV5ivSkAO1Yg0iJs5BHOqGH11uwu0Kbz4+rssgfYdwl/VdS
 w56gg2l+WcjS54XUelO4KlShR8FVpfSX3bi7LXuoKE5l7huEhxMfd/EQs0XKBY7q5BsoKDJBiNk
 gIcJV0O5sG1jFhFNe6wuvIX9V4qf+rQEQ5dmYbhjOrUd8ctZfWXKBSzNEVTKuLh+jucJCTye6UP
 a5s4oN0zwCd/MgbLC+QrY//dqh/DbI7heXWXFcUC+moJyYICKszGUWFoGq9KpqCmOphojB6r7TP
 DZVPIxGH1PbTIGUTzMNgOwZv8P5dE0p0ESM6EIUvcOnQf9QHeN1lBOKPZT0009ma8UUa7wWlRei
 AXSg0i7WAEoyiSciBsw==
X-Proofpoint-GUID: vNhwmC9yqNISz77yYGUTcgGlH2QoqGw-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040006
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-91746-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,cisco];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1EA59E05D1
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 03:43:58PM +0530, Vijayanand Jitta wrote:
> 
> 
> On 2/2/2026 8:22 PM, Bryan O'Donoghue wrote:
> > On 26/01/2026 12:25, Vikash Garodia wrote:
> >> From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> > 
> > This commit message is confusing and inaccurate.
> > 
> > First up, you're not factoring _out_ of_map_id() - factor out of_map_id() means to remove of_map_id() - you are refactoring of_map_id().
> > 
> > Your patch title should be something like "refactor of_map_id() to prepare for mapping of multiple IDs to a single device"
> > 
> 
> Sure, will update the commit.
> 
> >> Linux interprets multiple mappings for the same input ID as a set of
> >> equivalent choices to pick one. There exists usecases where these set
> >> must be maintained in parallel, ex: on ARM, a dynamically created child
> >> device(s) is referencing multiple input id's in parent iommu-map.
> >>
> >> Factor out the code where multiple mappings needs to be maintained in
> >> parallel can be achieved through callback from this factored out code.
> > 
> > Which callback ? There is no ->function(pointer, here...); ?!
> > 
> > Just make some plain and straightforward statements about what you are doing and why. There's no need to resort to dissertation-speak.
> > 
> 
> The callback in introduced in patch 2 of this series. will update the commit descripition as suggested.

I think, the callback was NAKed already.


-- 
With best wishes
Dmitry

