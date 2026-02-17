Return-Path: <linux-arm-msm+bounces-93149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EARyKYNZlGkXDAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 13:05:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4887A14BC36
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 13:05:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB5793027B44
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 12:03:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 023D7337119;
	Tue, 17 Feb 2026 12:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SvbWnXo8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hp8Ey7u6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B99335091
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 12:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771329807; cv=none; b=QCmeB4MsSwP3KASacsbX3Qsf9JX1JoLG1hCqV8VAoMrTsexbKoZjHCL8y5mQmW4f+fKTNEMFfhUZippsdN3r3lP7OiwdY9x/ItOhL2QmivGKJxHUazF2lJ5wp7CPslWZH4Nzl2w3YvzEfhEkLVAvREa8/oFoTd9o5iDMTMwOtCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771329807; c=relaxed/simple;
	bh=V3NSsjRzcska2Hz3eFdT6Nk/+5O//C+pPnEu8vffZ8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AFgutobXSvEiiajZgCKTQdFR8cknABBgEGPZxKMBkbDv901pUqksMLa7jRTNg76hRMTDACiQsNVVCcm1oY1Aew6dNloGlu+rkFv+RB/xU2k/MRmZJA+zZe8Ps6+jC54oHVrT3cijyvdmw3muYg/OxhVQ+oLzZTDhxDWLJM6Wtjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SvbWnXo8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hp8Ey7u6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H82AJe982436
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 12:03:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1UH/chMZ48M9K3k9g62/VMEN
	kbu6JZ9ebl5YxGNzHvc=; b=SvbWnXo8bVE01HdxoVB5dHi5gBvJ9U7fXumHtkL9
	1/oG4zpREtQ0vkQZfhKVmviqD42HYskFk7WTyNcCfF8pyuNGrMh1puRifu3T2vVM
	Xirm1G0KQsS83oebSmproKhjz4faBSoN1Mv2Z92V6OAOTmh0vuUkHixyK8uMus1d
	ZiqkIOz0i1FnRSYZ09bpqYJBCLzfM4rgN1Cj17zYs5hp6meMeKZEEihISBcD82uE
	6Y7taVlfcGOQnTAoBjrkAkHaiujdgI6TGlB3r07eqFBda/NYQoEW0YdgREDW/s0a
	bLQygjbeJnS5caEz+4td3v5j8leySwazNzfKzzeBaMuoiA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc662t9gb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 12:03:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb3a2eb984so4399977285a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 04:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771329805; x=1771934605; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1UH/chMZ48M9K3k9g62/VMENkbu6JZ9ebl5YxGNzHvc=;
        b=hp8Ey7u6ai2bb7IV3PsmCA+7o2va65EXVceo9C9+/zLWNGMpnNezdLOei4ZqRIoMT1
         gy6m8+8tcnkM4YhG6Rg2u8xy9/Tdc5zlzEbPSWFyvUCUcwoqgMNg9Rn8CvShpHur/6p1
         cIWSuOaKyOtV9I6whY83b1vEhw99WA76Jq8z8Pi2KUc1JwuTpdvGYY+sOXqrU4Z9yxvG
         ncUABLYHa4BC5bjvbch8mzhqH7DhIBua/1AMyhuQuPOtrLjWUQkKfMXq0PjzWy5oo6/z
         pomqiLCincRytZ3p8b2yZtlyz1vMIBXnK995CY3WCOXR1yqnA5AMPfNl3gMPOVCyN7H7
         7E9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771329805; x=1771934605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1UH/chMZ48M9K3k9g62/VMENkbu6JZ9ebl5YxGNzHvc=;
        b=OOs+v7i6y8/JJuiV2aT7hKYaG6tQNojHwWzGtNgZO6Bj7GDOrymqScukdDeU1KJ1UD
         i/gs7r+66Bgkbpc04fRNCVfWbNItMXdOfQG/Vqr7WfB4ZTdiJQBMeyikFQO5spNWZfhB
         37kPShcSBthcTjwXcmbgmY6kPW5gNJwTKVNjT8hRNOXY4K13UVPmxVj2U974+OZSkCG0
         pnVwOL8qPnWgJk/vITiX5M7nDuvq4uKSRXXfwYJzT96jnx+BnYT21+wu32fczVfB1eQR
         35g5HRufKSXDy+iDJOLKQBlohqfFeHe/pvj1LJEHgIp8gutox0fk8uLsj0v8Pg5JRHPa
         Diww==
X-Forwarded-Encrypted: i=1; AJvYcCV1rnbtrJUwqi5Lxa+nmMj6Jrc9Khuc/jrYF57iTgmlDrLrCkA/sVKK/YGNT6SUxETA9zYILHT4SRtJPdAe@vger.kernel.org
X-Gm-Message-State: AOJu0Yyiv9s6/dgXjYgZ33fiqzxNViJ9CBT/ikEiEgw1GxJ4hGQBdd/4
	9BefCaPic93HtInBrXhme+Mjlv9pcpJqSaLwS08HJrsNUoWI+kafeA/NhrWsJGtG/7bdBmdX05G
	o1WAhtrd4rBpCvCDQvMrElbML917YdlqC5UQuaPMF+Tru2WstIagCeXw/uz9yTI5+EegG
X-Gm-Gg: AZuq6aK5gUlQoMyVA9oTCMddea65Ab0wbOsvOpP4l92qgvxYh8wxxguquC8H6rfKXyB
	nknLh9qi2j+JRFi+CSKb8L9rtERxuwNUdGp+k86qOzozW4KVRDR0+N8r2tkEAVgQt+9ikRMLYWC
	6TOIOURIYPBdFBp6BkqjM3uO1gzyV2kjMP4E9+n1TrRONcIr+kDegddq65fHh8ghJST/Aoi0S/F
	YhBXmoLw9i47jiNTBSFf3V30aDtnhwVBOXlpxaC+COG2mJhDpMzAajt1j7LMz3EiyFmp5/XCAA7
	M/eOKh7F2xqokv5ZzMVcYeJnHBYfRG4Gsv6rydAWipbjiBniHQtTCrsi53qx8dSuQDSVWyQBG8H
	CAf//7sy1TSoNQuvirGG5A7ioxf1sxE38dNN7
X-Received: by 2002:a05:620a:a508:b0:8cb:4d9b:6b48 with SMTP id af79cd13be357-8cb4d9b6f08mr1048829085a.6.1771329805247;
        Tue, 17 Feb 2026 04:03:25 -0800 (PST)
X-Received: by 2002:a05:620a:a508:b0:8cb:4d9b:6b48 with SMTP id af79cd13be357-8cb4d9b6f08mr1048825385a.6.1771329804732;
        Tue, 17 Feb 2026 04:03:24 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4836aa0847asm555188455e9.3.2026.02.17.04.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 04:03:24 -0800 (PST)
Date: Tue, 17 Feb 2026 14:03:22 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH V3 4/5] arm64: dts: qcom: glymur: Add ADSP and CDSP for
 Glymur SoC
Message-ID: <45m4c3g222mfkyiff4qqcvfwjfeqszrfvsg6dcwrlnanvrodtg@ilheo3ppgwsf>
References: <20260129001358.770053-1-sibi.sankar@oss.qualcomm.com>
 <20260129001358.770053-5-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129001358.770053-5-sibi.sankar@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA5OSBTYWx0ZWRfX3eH135oiXsSr
 N9Q2Kr9lysRBJC7ssiVJczPaojdobpPEjT9Pdnzt3cOorKmBiuYQLSYkHXmcAk7D6+GO5FNsSkg
 IJcKItrhN7opP03GcoJx2jhl0AXDqT0bTNbgu/1tXzSbvltBqmTklXe+PkoGgHw12g7LGf5x7Ii
 CiCe0cphd18xVTWLIql7leib4aN3EB0I+Ec+F96/1KsAmA88qJyE9qXJGnEXpW9lLQ1co2AytL1
 CNW5hgBB8HDresyKNn1x/8l99mdXCxgWzeNVGFmT/OhL47FajVxEmeS/T0NCBVMhX1P9D8kPvqa
 divUZgD21/ZxFCpv/ZOY94LlIxUUi+RJ41U6xb3VYv+3NRvo66sWsUSKIoUWy+nuSEZjxXd1lsu
 cAsx9d6Zacr+Ksdai6iShJzZvbSJfC/WV91KvPco7jlQgfZs+emZ89lrFkpz1PYn7PVmyijze1a
 ZE7edQt0smPvHFvgWwQ==
X-Authority-Analysis: v=2.4 cv=Y6b1cxeN c=1 sm=1 tr=0 ts=6994590d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=JOSM2k-csAVseA6ZNKgA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: JEUsvAeH442Cps4rtO3Nj2T13Z7ELXu_
X-Proofpoint-ORIG-GUID: JEUsvAeH442Cps4rtO3Nj2T13Z7ELXu_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170099
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93149-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4887A14BC36
X-Rspamd-Action: no action

On 26-01-29 05:43:57, Sibi Sankar wrote:
> Add remoteproc PAS loader for ADSP and CDSP with its fastrpc nodes.
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

