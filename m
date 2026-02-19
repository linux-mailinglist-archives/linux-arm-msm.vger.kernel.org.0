Return-Path: <linux-arm-msm+bounces-93340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODbfDGa0lmkxkQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 07:57:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5847715C8B6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 07:57:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C696D30080B5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 06:57:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16E7832692A;
	Thu, 19 Feb 2026 06:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cw+iMBp7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e3wDHh+h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB737325729
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 06:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771484255; cv=none; b=eCoe2ct8ZrxQn9a7teVBia94Xy8R90ceYIPYgHml0NPpJpcTbw2vS7U/DIArqFYuolV6QsNtKJ+UIC2SnI+1yuM24J8CB2+swrg0F59zQMEh3+0INEbKmFXVAk08/EMhP/Mn8mWnNzEfxCyy1jLz9iwuhFW7RshrsR2CbrPYQnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771484255; c=relaxed/simple;
	bh=Jnv+qhVIrPxgKznxHN6mnLAbbjdSJ6MHkU036c9TN3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YXxEy5IrzaWHBamUNkjJgaoPr4hMOoRUn8WcqzgOHLpw6Ygb2s3KDzcIZ1cA43+loYeSYkP5sRj3sP/iDi0p+oQ53lgVBVI82XwFZGs3uBQVg7lq5uLkl/EH8/4dbL6pvIh7dvM+Ua8JY/XlV4ytJyjlAYpPLObZsX8xnXngjOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cw+iMBp7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e3wDHh+h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61INqP1o2885457
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 06:57:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CWwYhGQjrLY53wY8CjCcjYMR
	u9scIOxaQdYVTUIyAz4=; b=Cw+iMBp7W8oUqUyfNR5x1M3dV2KRSUZ83nM2mWd3
	e6bD4dMpVc5bVBdWo7wO8fIt8gVRPmv7fOqZwPmV3fqPztxRGgvECPEvq9Fm3Rzz
	WgdtC65a+OXk7zwbk9zDQw7CuI1qZAzUZ3BTlQ+TnW2RfEE1VYXOqe3uJtT08tqZ
	3zHUnvVVdR907HGBctBgEC/65JKUK16ZBDKrEnaLyMwZNkuhF9yhaTKDXpILuz5a
	z053rb1xdLV4CvvZS+hPeko7dd8qXu1xHFnUzFaiHOl9ecx0TjD93BNHsnsbRNwf
	fehKuljA8eDBmDP6oztZQXYzHChqgoP40CJVqo2qgEXfJw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdqfg8qgp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 06:57:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c71304beb4so360742485a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 22:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771484252; x=1772089052; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CWwYhGQjrLY53wY8CjCcjYMRu9scIOxaQdYVTUIyAz4=;
        b=e3wDHh+hdxpoc6CkRGjDSzK3OU6mXsBXJewbZVuixb80IV17VlDac9854WhnVy74ce
         DsTrrC6OxPxxaC4cmsYxxqmvfYDSe1pssbLomDgcXRlVqqyB//OZG1fnWBm1L3BUajZL
         kuSI7BJiQfNgKO6bort4FU1Yen4IDGv8fll6OXgc/EY63R0HtDqm7m4MFJcfewvxTM1Y
         kw7c9Y6S+FQLZiK5HBuFFs68ivXqQLTiwuzgQhdzhvB8NS1U8tFjdPDYphzWrD5xeJyo
         Cbbfaf3hN5PnQhRG26VFCk2fsWSV5i83eVGCjC6TWSNMY2xkBt1YjrZ5fFmodrkjopkC
         BIgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771484252; x=1772089052;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CWwYhGQjrLY53wY8CjCcjYMRu9scIOxaQdYVTUIyAz4=;
        b=CKgtJ1wvHRaxeHjg/xw4ajf7PAHjF3pMIzAgtfzT7p4/DemhzcijtTYPuh9Ci9unke
         NkOFmrjsnkNk7epfG8uIdmUNOc6zMxZRndK0pCDcJCAt4PUMr9EMIvPOPVQNm292CuRt
         BfNbfDLyJx3gDE16stt4hntJLX0OVbdr3zFwceGRrtbV8abovTJ+qC+AouaVH3/f4WvS
         ONKDGNQ83xn2UY9vsLe190KTz26xUseBC7sMKh7gX5XTvkrn+RyIXTEhzEvhlJPwTiKw
         V0ALWkqL4LOPcGl38leKy886K3oMLEXYbu+PJgKd8/EED8REY/o3KaC/rnHLdcvsM9cF
         0v9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXFtJZV3/4L23yPJ0yhj6uDeRkvDVnjlYYP10ElsT1YDU1oAVzkRSBMDl3++WQEtZXzYr526B/rT0VJwHd2@vger.kernel.org
X-Gm-Message-State: AOJu0YwT1LZ0H8EitLC+Iqlw6axYAlRrrp8r7lB6AgyjS32TXpOeiT0b
	jPqIhYSbF3c7EhtgAruLw1kRjkmz80Z606HPCHcXyBEy6dd1wW1ZyDLejMRzCBgtpWFpFl0f5rd
	uqp7G3pyHfUXr1HNC5KR2k+jC/msZ3fbGaBB2eA0E9+HkTp9c/5AaZZOxpFDpgSor+uA2oGmrol
	fl
X-Gm-Gg: AZuq6aL58FxEr/73yZ3M+8VpwcDA5Pew/gX9swsDxwXLjMWdyyp5L9G1W5ltKGszgd7
	7+pj+t3ixCIuJTl6gkOlHTTqUrlVSEKIRieUJrRgSFkKU5gbGxHPxlEHdRo3CpW9Z3JbR/dtP3o
	dB5hPcBzHPnAhP8pin3LKLBlMf0G0d0KqX6ED5Y1SWtBgLcBlZZnFUeGZjr33ih03NScYKnOjiS
	7AJJFFah/iWaetNwvoG4kwNNT5rdrrKLfI42IYKgXTyaAsAlvZwpZsG0T5YrC0B3LuJmMj9aUav
	dL8erxoAtpsllcUiE6uUIQ94FSZ8NH4TONOKA+n+bwHCQ518HfSwcOTHrhCuhNuI3xFSTEbOdwb
	eZwCIFQeLTc9ZQ2x1/UmqO2APEbvpnoSXqUsDIIpKNh7xa5qJJIrg31RZ/UXTsidpelA7764rz1
	JGXSgT5Auh6o5O7HhEYqMs8pxWtEZYmd29T+E=
X-Received: by 2002:a05:620a:a31a:b0:8ca:3175:cc9f with SMTP id af79cd13be357-8cb4225fbd4mr2064920685a.7.1771484251950;
        Wed, 18 Feb 2026 22:57:31 -0800 (PST)
X-Received: by 2002:a05:620a:a31a:b0:8ca:3175:cc9f with SMTP id af79cd13be357-8cb4225fbd4mr2064919585a.7.1771484251510;
        Wed, 18 Feb 2026 22:57:31 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f5a50f1sm5268200e87.42.2026.02.18.22.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 22:57:30 -0800 (PST)
Date: Thu, 19 Feb 2026 08:57:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: qcom: sm8550: Drop redundant VSYNC pin
 state
Message-ID: <nk26ukkcpjdklfox7faiwk3o3qbvym5ptimhiuaoe5dn5qzbv4@po2c2isxmjh4>
References: <20260218-qcom-dts-redundant-pins-v1-0-2799b8a4184e@oss.qualcomm.com>
 <20260218-qcom-dts-redundant-pins-v1-4-2799b8a4184e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260218-qcom-dts-redundant-pins-v1-4-2799b8a4184e@oss.qualcomm.com>
X-Proofpoint-GUID: w5ORdW1Os00n63H7F0Uc4qsc4ycn4woF
X-Proofpoint-ORIG-GUID: w5ORdW1Os00n63H7F0Uc4qsc4ycn4woF
X-Authority-Analysis: v=2.4 cv=A6hh/qWG c=1 sm=1 tr=0 ts=6996b45c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=NMe5sQuIffPLTvoV0ecA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDA2MiBTYWx0ZWRfXzAAjoM9G2hUb
 aZ5S5CeKYttsITMrMuqsNruffORST1hrlJZD/cuFE1n5sQG52X8irMtiJzkx6z9PHHqQcmWYtxs
 Y/N5MJJtJ0zunBEsGIfdZFFFRcLuw8jh+gtlHAHD9ViPWWD91pW3fidHfxMcStOO4riyyHEjd8H
 Y/dw4Erz0LxSJAJofHG12yBd0AYsg9H83KbsrP8mBrgfB3ywTIw2+TgDKkRMWvBZDnOs0Pup1sC
 l40YgArfoeNh2pcC0dhzC+crFxb3hfuDvA1uJuyHsbkZGSRRQkIu5CixcxEXXjogMGdV7wVV47a
 QzJBfJJi8v2XA62uP2ey/PcIIy139nDM9bIYMUua1MpAziHP9s7o0tnjz7tnSvP8NOtmJ75q4X8
 gbHHX0niFAAvlpf9SPtolofbz8/KZ4LGs+7ENyFRMQdVvCX7xEI63KpMZ/qK0mRw0tlJReGv53/
 T/kZISSW/AEDp0M7tag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_02,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0
 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190062
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93340-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5847715C8B6
X-Rspamd-Action: no action

On Wed, Feb 18, 2026 at 06:24:26PM +0100, Krzysztof Kozlowski wrote:
> The active and suspend pin state of VSYNC is exactly the same, so just
> use one node for both states.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8550-mtp.dts | 13 +++----------
>  arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 13 +++----------
>  2 files changed, 6 insertions(+), 20 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

