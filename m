Return-Path: <linux-arm-msm+bounces-102703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMF2Bq8i2WlrmggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 18:17:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E39B3DA420
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 18:17:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4659D30DD466
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 15:58:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C405E3DA5CD;
	Fri, 10 Apr 2026 15:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pp1x88sv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NGSyFoWm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894523CD8D1
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 15:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775836710; cv=none; b=lE1kdC2i+i77cFMG5c2ekuYPgP56NWw0iYvf9okvJO5cfdbw8CJ635ciXcgtmwnaySY+mjVoUwtMd8grCTCZD/C2Wz85Zh8iKHIq1jYKtVbzPCQm8VByoglMYErfBEKqDqtKoJGDUl/5wShbghEDZlUq2pPskgJEdTbzrbD6nNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775836710; c=relaxed/simple;
	bh=DQ46fuCnOs30J1b7qv/oU645DN4nh4mU4NqMfGzaMuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rXbQ15EObvcOiXo3s9boYYkqxrI4qVIYQ72uTeAsMhwi/nqyr+oabbea2DO4I90SgbYaytkD15yy5aGCtMYt8U+RUATxQXUhdkl0mZDsh6FJYdF78jFbAo2nF4iG4sW38rwYW979VsclylUXAg5cy/rUL2FOb0Y+8kLbHImU3hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pp1x88sv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NGSyFoWm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AB1S7I1322650
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 15:58:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=p4zsTn/f0tM4EO8VK74LGzJh
	aI0WnVomtNRaWeIJTJs=; b=pp1x88svEbJ0TOhbHdiJItKYYZRcw4PDOigGuufT
	RZ5Tqz1AiUwEtit496o+ztMuY9IUAUl6qE3WLr4WRNuZFQDCEMrej8I+qFxvVEzi
	vnvVXNXKyNyJKbuqcD7iueQO1RVD018T7x57aa2fOGrCqlX5mjZicfanmV9pb/PU
	C/ITsx1nszlkOGlAJRsrypl0Gs05fMBAODHOgzjExTaZTPoiTrTNIlYR4IlbyV53
	oPjvZwsUNEWBhyrqCqWqRqphbn70ybVZZrS0k5rnFtnjz6+d1nRFCmvwsrmhsTnD
	SZvNupyVEWaoNa28IObgKjEAtv/jPo0rn6N1ghodo++ERg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deyyh8wb9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 15:58:28 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2d4032ba014so2105764eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 08:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775836708; x=1776441508; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p4zsTn/f0tM4EO8VK74LGzJhaI0WnVomtNRaWeIJTJs=;
        b=NGSyFoWmIVuXj83ZNABJ8cJdIWyYoLRH0kNlxl5G0jokdq5bJ/Kj6Kw1WnvCIe4BEx
         NUgFeppkMQxdCQ9kk6dNfJ6jTmMH8E/wZsGHz7HB6CnJNbGqK3YLG641GTGW4dStWkV7
         aeLVn9W+i0VeUVrBuKzEMInFqB3rnxpjxanN7qgpyG1Ub8gXz30MsbuCRuZIwddzMqf6
         a8iaOGhJEdc+F9ig1JDHSUniYTI5TYFsxVA8d47hLSVizue77Z+AyJ66jTYevusojMTv
         BTkVetP0aBeCNGBkZ1czd/KH19SCTP4vxOriXA/LaVBHYNxe3c8mFZvV2XXjN3DDUImZ
         kpKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775836708; x=1776441508;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p4zsTn/f0tM4EO8VK74LGzJhaI0WnVomtNRaWeIJTJs=;
        b=TMM8BTgoE2M8J2f+VpmpgylDJCmVkl2KYgdReQJAQMbaJhbGnlw/piZQxctrDwjMH3
         WCSd6IR4FTcgUETokasDvia+TamylI36LIm/gJ4dn2QJ8KCb8yhypn0JhL+gXfU1OniT
         2mpGocFJn73N7+RYjkzpOgdRYij2txtkOXVkFMfPaSzn1AVbQc66E2DEBjvZJZkU7BjV
         7HC2diREwfbB7HdAzaHFpI+qdAmDhgc14d5o0zNKkCRQ6mvTEtW9McVl/VjbIfxDv9y3
         xi+MConnz4QeM721DvlvCGdLrdfOSWxq3tfUBcmOQA1apL9yBLJO9umkyIzGujfW1qMa
         Xthg==
X-Forwarded-Encrypted: i=1; AJvYcCXTY2vGFVgO1bPjGEe/6WSmPFwlsiY4I3pvVg8txpnwpVycYKEbs01yrGhBPenYKvinDzm3t6HmJo+phrLx@vger.kernel.org
X-Gm-Message-State: AOJu0YxveqfCZQxEU5ahLTlu2Rto9d4gJ4tuXgabsFET7/rdXg5R3JTL
	v9LyIgoDJSEM+VXnKMtgZepnD2vd3W5fnUM56yrJgJgooeDo7O7w96cSih3uQl9CshuLXizxApK
	VMuQcWy+MyCbO7zs0/YBuW0HxbDlGdbFlLlXnqbN6AAAlzSVXZhslC8Nt99982gKBZgeP
X-Gm-Gg: AeBDiesN8aWk/izYLfX1Urmb2BkWOTGIh1tcioGzf9emmDN48ySUuglRQUUVlzYtvfL
	17+DezbjB4G7xLiVTYj5ox898zwYidLt0/gv1rorL97os6oHsvA8CQBe5EyeFNbFH3rU6Al9RO7
	ABgMf3bJ0+lj7/wIVG9wg+PkYBt4GE1Zh0r5Y9IaVtnP8GsnOyIqNo3cBXjf1DYsuMTU5yxpfej
	t9phwEOtF98SKdeP+lAVYkpSdd0I4x/woPP3w3zY0l3wynz2gOxbZ6j+y1AsfOu82lpJzTBT506
	RmVb+daPNTTYcfLPF1pCd9M9iIs2t8dXU/LDggubuXLj2aeOqqLrsic4fmjJ9n8VhM6cafLyuaM
	Vtq+gDtMSX3jV+mGlGIsYJq2GirX4Ysic0HBPz4qU421AS6fkyWL8Czt34ohX67u01VgscPEa1D
	Q=
X-Received: by 2002:a05:693c:2c0a:b0:2c9:ee15:a0e2 with SMTP id 5a478bee46e88-2d586991ab2mr2320129eec.8.1775836707526;
        Fri, 10 Apr 2026 08:58:27 -0700 (PDT)
X-Received: by 2002:a05:693c:2c0a:b0:2c9:ee15:a0e2 with SMTP id 5a478bee46e88-2d586991ab2mr2320105eec.8.1775836707032;
        Fri, 10 Apr 2026 08:58:27 -0700 (PDT)
Received: from hu-mdtipton-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d5632a64easm5281349eec.31.2026.04.10.08.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 08:58:26 -0700 (PDT)
Date: Fri, 10 Apr 2026 08:58:24 -0700
From: Mike Tipton <mike.tipton@oss.qualcomm.com>
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 7/7] clk: qcom: Add support for global clock
 controller on Hawi
Message-ID: <adkeIEhSRERfEBRO@hu-mdtipton-lv.qualcomm.com>
References: <20260409-clk-hawi-v2-0-c7a185389d9a@oss.qualcomm.com>
 <20260409-clk-hawi-v2-7-c7a185389d9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409-clk-hawi-v2-7-c7a185389d9a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE0OSBTYWx0ZWRfX5MBDQgYC8/F7
 sGjc0F/TTBlGZQSj5KoieeyX6qzVNaxPvuyHPFcZj3rnMbYprOEq7lAX33CFgO8KC4pcz3FI6Ff
 HaMusVeIBPZ0sAHoYrEAuUOb424+1DrpmuA3pIPKe7q4ml3QOZJQ0Kr8I7EMy0iQ0dFThXusFTz
 VZZse++gwLmqKDIpOwUefZJF915Udzq7bx0MBbBjQFsDN6DsPfOAliEX/Vqsk9w1R4g/aeBe870
 DjhkhCXFHgEiu6xsrXV86ZBy55kIeI5h+zfpDR/ULrNXyVAt9bb9uKK3eqgHTnVZb3ytuU0FCwe
 0ob8rkXBv2xG0PnScEtVQh8dVCxaFTuHwJ8Oe57ww6HPn2y5TP83ZcaCOYHw6ra+qzTzRO1CX5G
 /BOv3K36DAQE1mtycwiCxYyN9Sqjwx9LOhcx1Jfv4k41k42NP91O7WJoNt1XDC4S9h7K4MYvf5q
 3Wc5XPCmFQKxzzcj2bQ==
X-Proofpoint-GUID: jWlvbCow_uip5_Wv4Ji0BIRl9AJ4ih0n
X-Proofpoint-ORIG-GUID: jWlvbCow_uip5_Wv4Ji0BIRl9AJ4ih0n
X-Authority-Analysis: v=2.4 cv=Wv8b99fv c=1 sm=1 tr=0 ts=69d91e24 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=hcFGLVdanMBVBe-XHWYA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100149
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102703-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hu-mdtipton-lv.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mike.tipton@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6E39B3DA420
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 09, 2026 at 01:51:41PM -0700, Vivek Aknurwar wrote:
> Add support for the global clock controller (GCC) on the
> Qualcomm Hawi SoC.
> 
> Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig    |    9 +
>  drivers/clk/qcom/Makefile   |    1 +
>  drivers/clk/qcom/gcc-hawi.c | 3657 +++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 3667 insertions(+)

Reviewed-by: Mike Tipton <mike.tipton@oss.qualcomm.com>

Thanks,
Mike

