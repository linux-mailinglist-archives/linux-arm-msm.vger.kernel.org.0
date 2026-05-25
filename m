Return-Path: <linux-arm-msm+bounces-109638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMBFH+QvFGqUKgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 13:17:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD3F5C9DB2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 13:17:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F2EA300915B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 11:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C48637DE80;
	Mon, 25 May 2026 11:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C/Zg3n6r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VhjcEcla"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D3537D138
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 11:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779707550; cv=none; b=bovxLBW2m+oxHlQBYZTDzqDDhbb8i/EJATSFaJO5urguovw9wt3x0GyGlXEMXnXpPLPfaUtgREClJXPO+p+tFoRIKe3RbgnAkUBRf7tSy51lNjGDfI/BeN+CIvB4yjANzlADC/XC5ZMDRi/ZKqzThJ9XcSKCSSpFmqp0PdKjGok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779707550; c=relaxed/simple;
	bh=V/oea6YVUd79ay9np4Qf5CD3ZT4bLrGCN7+T2AQLokU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ODveBVft84OfIjS4h9a7vhMQQSGatmY08EmdFeLlA3k6bK3RQWbW2TOPi3WnxFsA19ID6+ZwTdwPRgP7/ui+CFuA0UQUqg6rF2R1CQQzWCHG6uHVOPdn0vNN7BUOsaVBq5gA2fWUhWC0KoqF3x42yu43lQegPgOdLuu6PNEbzX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C/Zg3n6r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VhjcEcla; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P7Y5ur1630363
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 11:12:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mNbFyNHd6yc6F3SvZBtMoTUR
	fXgxrtQi1GfKV4+Tz9o=; b=C/Zg3n6rQ0L8MoUFWRlOYVxnkaPKV8yxzl83gPLn
	qpSCjIgi4LoaGGV+qBRYhq11ZyWbHBoZhyCZTZ2ge5UqB8VmXL0vbwz2BX2xQnc0
	cJqZFc871NmipAdt31lwABPG8c64qh0zZJOVW0QCbSo0/ZxeKglt5lnfVxyEc9Gv
	vCvzMguAp0WwuRCOFqgBf2ADM53/vYEgBUHkJVZfPLXdTeIcd50e2nKVE5Cp+V9S
	O4SWQgGqKo6Guuo+kzn1gPyb05OezPajqnXnS5Nb1sSRimwEXlHGaTvqhiZQY0ZY
	wHNtvaMb5tm4wvqLLOnvaP7r3hJIuOn+ELNwGLBj2aYaIg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb88w5uwe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 11:12:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-516cdd89225so81442311cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 04:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779707547; x=1780312347; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mNbFyNHd6yc6F3SvZBtMoTURfXgxrtQi1GfKV4+Tz9o=;
        b=VhjcEclasa6YhbL02SOzcEwSiZAElhzMTVUz6QOkSgn4gpc6XphVshmlEv7nE0Ia12
         dr8LSCaQo0sKMNxsLBJz9qFJfHGNLel+4Si4LeTmebtNLNFIu53ol8l/sLHasdUIQzia
         NOkycIt0gHMJJQ+1HoHtu6etK72ntHp1Ehg5RgxCKNZgrtbVDR9k7e4RH9JLt2Ixc4Cf
         5ILyaWjguT6l/HIO/Qmh+GbA5whvlPY0ws5hX4SgCHhRDD/+EknXXFB3hhArqEXpXnNO
         DQfjkVmoTpKyUd0HIJ+xL3EJBy/XgvsL5gN9ZGW9nTyqZZEEq1brc2sZ0jjE8p9yo299
         roKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779707547; x=1780312347;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mNbFyNHd6yc6F3SvZBtMoTURfXgxrtQi1GfKV4+Tz9o=;
        b=B/szRhxSzYw3/a0N2IHRbZpevRbKC1rRqSbXks+q+W0kDfGOlgS1SOKhGTcBY5NQLS
         iiyKuIDEvCzxsuGGfI2ru+T5gx3lrlkjzrPoV5MEhVoMAr+yI8MT79NOYQLRSq6HyemF
         GksS2/hhQUGZOWoOr1BvgVs9aBlCzx8c4X/CyRh+NCjpQ5jGfNkVTJiU9KgORw8Z1nVj
         w5bn+qu6sgmii/cjeOPtkBouEZhzecpQpoqxckarsmilkBvlT3uhmU4y/s+gqizSuC+t
         cRHG7j2f6XUkFPgrfYxKS+9tbZpD3kGVTF3+eAAfunqizqphm48ysUBO/LwVaeetgeg8
         Ig4Q==
X-Forwarded-Encrypted: i=1; AFNElJ/S1zOigpTkiBuW8DJiO5EE0b1R4DhAseHAbcU5WRvjzbCc2RP0cxm+pTF5J7WIYiX5t5sFkzh0tD9vTCL1@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5rqjcgpRnqqN9ERGtwEhyZtb8JbXih9peE8TDTUeT0eEl9Nww
	Cd57NvcvrOLMtQ7/GTc9NDC3IWSJgXeYV20eXZEc+gN61nC6iwr8r2rqPBinF9P+UgIk3mXcoqG
	gGlAlSNTiX+XVDLBnbkiE+g/Z8qXdd3ILSlBhJiTrhUlcZ22n50KxDKmKIXsAeTbxKjOs
X-Gm-Gg: Acq92OGQZSq4wlbz3UfC2nBQEtwfBVjSLxfF5kbwIGynvbAppQotTDJsZG5524Qz+Ml
	vBw/9aQLH7/7RUyj3i0SPFSTbmayp8hkU8tRShCYBYMMMGrckpgULUTlbxvQUqDsbjkBVTPRS6R
	UsvghuYlDS9NpolesiB1UAwMtszSU6FEXi6c4+hSGllbQ3cUnhARZPDCYTs8Vz+hyStLlZpSTIw
	zMCEgZIQ4ry7M7u8b5+90ScNxBkokNRCwaPBZufhvKvk08+S6SzwPXAUIs8nDMMryisCcSPNYZj
	3bL6E31L69q9W6uJbxAHjLOUr3BveZgmggrbPOYP2+ljVlfpMN/kD0kJQEVHbIWroLLnyqIaBpl
	FW8gXA4NMLSnH/jSvDpEhYFooK0Ia4gGK//EG6gyNq1ft4yE0y7/Gm0HM9bRc6S3w3j+Ccc5RKk
	fsUJZ07YLwl6ne7u4rgpx5Cgcv6RU8IQVugjo=
X-Received: by 2002:ac8:578a:0:b0:516:e152:7a59 with SMTP id d75a77b69052e-516e1527d60mr118409401cf.42.1779707547088;
        Mon, 25 May 2026 04:12:27 -0700 (PDT)
X-Received: by 2002:ac8:578a:0:b0:516:e152:7a59 with SMTP id d75a77b69052e-516e1527d60mr118408951cf.42.1779707546620;
        Mon, 25 May 2026 04:12:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395dcc2ecdasm22191671fa.32.2026.05.25.04.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 04:12:25 -0700 (PDT)
Date: Mon, 25 May 2026 14:12:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 6/7] clk: qcom: camcc: Add support for camera clock
 controller for Eliza
Message-ID: <lbixqj4cgausikhelm3iq5kamgmxf6ibhv67p6aya3fyqpdck5@ygy2yzntbo35>
References: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
 <20260525-eliza_mm_cc_v2-v5-6-a1d125619a5a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525-eliza_mm_cc_v2-v5-6-a1d125619a5a@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=S/jpBosP c=1 sm=1 tr=0 ts=6a142e9c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=jdZfh6YgxIVJxXzoon8A:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDExNSBTYWx0ZWRfXz0PLskhmhyO7
 xRWPCe3nMw3Dpy/xQZGw+yIQJxXVHfNeVsnM3YX24KZSe3+o0tCpzV2ZO0ee8vjkK2jWqebEi6q
 YfUNzIhCE2n+sbvvV6mCEQNDQ08+474qlPRUvHahFinbWSgykLKdcYTI5HLzEz9rmNFd4O8w9IY
 fPK35+SKZwnqrvpOOzRFEoRVo/CdVfxSdPzL1Z/UaVbwJucoiiI+gMoF5wrsyP/ws49FzsDLYuY
 8lhF5a144GvT1x5dVCY0SIyofS9S27wnI0MExOx4pAccNrmbK4VoGbt/dlt3MhDjc3M4Q/QR4Nr
 svUBG/RKnTagIDF2OoM31fKVdm1MA8GMy68z/IUYH0Kqkinlf7/goL1JTP37g8aO3Bwz3PgdXS6
 mkJ0H501HPLlREvlBLqBI8vLRKf/XCpjDFCF8VY+SMY3CIHDVFf/fuPXshqCO5HuI7M9yQjKBmH
 gNErHDxQ3bs9gJFUGyw==
X-Proofpoint-ORIG-GUID: b18bc_u58P5a6BD_cGyrihL3DFJlPX63
X-Proofpoint-GUID: b18bc_u58P5a6BD_cGyrihL3DFJlPX63
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250115
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109638-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,foss.st.com,fairphone.com,oss.qualcomm.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DAD3F5C9DB2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 25, 2026 at 04:16:08PM +0530, Taniya Das wrote:
> Add support for the Camera Clock Controller (CAMCC) on the Eliza
> platform.
> 
> The CAMCC block on Eliza includes both the primary camera clock
> controller and the Camera BIST clock controller, which provides the
> functional MCLK required for camera operations.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig               |   11 +
>  drivers/clk/qcom/Makefile              |    1 +
>  drivers/clk/qcom/cambistmclkcc-eliza.c |  465 ++++++
>  drivers/clk/qcom/camcc-eliza.c         | 2803 ++++++++++++++++++++++++++++++++

The camcc and cambistmclkccc drivers looks pretty close to SM8750,
except for using a different PLLs. Would it make sense to have common
drivers instead?

>  4 files changed, 3280 insertions(+)

-- 
With best wishes
Dmitry

