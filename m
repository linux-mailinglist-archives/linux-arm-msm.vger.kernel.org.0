Return-Path: <linux-arm-msm+bounces-90544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0GpiIcZXd2lneQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 13:02:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EF687F1E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 13:02:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A1BE3006383
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 12:02:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC37A30E0D5;
	Mon, 26 Jan 2026 12:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A5HfPT6j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D8hHiatY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB6A79DA
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 12:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769428931; cv=none; b=EAeF8hh3qtUu6PxGKiWeQLuzuR+GpamCiF7R0ugqZiBS9SZn9vj+hESU4bN6i9+4JD/FSPIYzcNkTBSZI5wJR2FLjkPGUMvjZ5WONrobk/cSwKMgqS2w08Pq45U+xgA06fDHLTB3qZuNYAzayab2l+fi04zWkIHXmhL8RGoBfzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769428931; c=relaxed/simple;
	bh=+5o0H12vA8bwyvlidCl9GckzEldvWIn+2SUuBjYyM8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IJzCWUyj90VTgHbmebC3Ep4vU7FnKCITQPDvo0F3BFMYLofRxzOnyGn3ajXizOdIhQqiToRWStz6SWX1CbHEJAMD1rPTfKkldNacwGFiKU6fLybUwNM4qcMC5faHBFHhhNtd4s+8HiADwQOPz7HCZ2nh+IksVaR65sLT0esgHd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A5HfPT6j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D8hHiatY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q90Es44099477
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 12:02:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=191kVwVHm2K0DfJcsHgO8LYf
	afsR7Ibu+4/CuNbIkXY=; b=A5HfPT6jljpZM4rVOo1bSLf+QBsQvs/sbQKAU32s
	VOHaioD1ZU81vMKQQZOuxbrwEkT2Vr1H1ZcSImt1aLHwlZQcsiJQ8dEm+6SY/6OL
	f9Ad4QFhoAiIowHHJArXMgS8clo80W/3QGLTkIuAchc4iA9YmY4acbwEBI+66rau
	fGTWDtsB4+4F2YO7Ri736KHOYbkXaMckkPeme+rpYvIlHyAPqTkkzbEx7CMtkfFE
	xGgTJCIn89pGOeiTp62pHVUY9s8UdjkMqOE+S3OZ8O+NON5WZIikG77j2C1Gp4PM
	P2oD0WUxjIfl8lxWb1bkmOBHowXF+S1qJ3pLjOjegf3pFg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq6xvdev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 12:02:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6a5bc8c43so1198024385a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 04:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769428928; x=1770033728; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=191kVwVHm2K0DfJcsHgO8LYfafsR7Ibu+4/CuNbIkXY=;
        b=D8hHiatY8lyGnRUyKvKR19JavVKDZ7sJke8DsLejcG/uLxIiSYpERcAMiFKoeeDGI2
         wUoS6967q0KzBXDQIwO1aOkqBZJSNOXsstGRz1VYYvE2KDo1/cdqKpjWVDlwiktX6XNa
         DUIV0KDoUhvg0XN1ZQiV/VON7r74xg6+y4vmmanC5AVVrsbRRU6QiT3D1DlPeuAIidiI
         qLbihczycvZMs+PLWQpczfoyULOzrXBZxfGLT6eFcdQrBPZwqFOy57pWftTJUAN/gLXT
         3l8iCYgvmPJkDsK4YOjRelJww0UM6YC5DpmXqyvUWSfuLBe6TJ26miu0A3XPf27hOnPn
         N/4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769428928; x=1770033728;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=191kVwVHm2K0DfJcsHgO8LYfafsR7Ibu+4/CuNbIkXY=;
        b=X5+sVqvcnrpiOJ/FGZr+VlgLiTN2twahkGDlw8c8bQW8dOpiU6AAdEPyLP/nCOJ1a8
         BbLWoD0U36Jh95ulOCqF19EhD0bhKDbK4tbaWxq+QYuevHV/KVVHr/JBVgTQcUN+hwV4
         9q3S1NgNvOpThMsni07ZvFbgP8KU9OkOV/zsR7n6L3PzA+1VpaVnOl8Q69t6nVc7nkX9
         SRzHqRK+FPhvX6lnFXYevFkByoWA4cMri8Ttru+npu15FQREpBB+gDAtnCg+l17a7pm3
         Dadc5XjDYeNfqriIU/mezMKomhFfjd2MH2zJ1tpZTNviQ8SGotZaF1wWHZO0bVHE1jxD
         lgZA==
X-Forwarded-Encrypted: i=1; AJvYcCVvt4XYtDmzS8XPuMZbQfIDHjYYNDXwNZwowXXz49a83LgXXNOtWHy/A2xaM9hpxbG8PecLXeSLOXWXyNYE@vger.kernel.org
X-Gm-Message-State: AOJu0YzDZ279oMZSY2Wd0UptmV6daG5NivbQgPGz3alFoS8ldtWhyUaX
	8kc56/IY1iXatrUE4u8oDCX4SKN2CVV87MacfAVx8PDAukyhqxX53pF7hYInUJ3ZcqZgVxGTcSG
	OgGVfAcO3GAPrQ7h0yWyA9D72Exc7r6n93piDUscJEZFBfDOSUeny4X4Q3pPsXyDB14/E
X-Gm-Gg: AZuq6aJFoaG1xs5mNLpACrESxzB6zJGPckCywdz6k8Ao+Kr34vcOWVRjeMYJa35vOiJ
	TPWughTpq8rcY7YXRKK6ffI7SLDimv0PEOylMUWiOP+/xYW3U9BPXchtlzOn8/dSv8QHN17uoAj
	zRisb4XXQfAKtxfhvCejVMOtBS/w/GiLstp/uQEEXRbQVQVir6myUqo15Sg1OxDi/6B5SsWntTy
	QzYrbIZOLNrp7kTY/PvILOLMQw+DUPlTbZfGSEyqlP9WAgDXJhkd6g9rZN4b6pe+FhEk+pmcyoI
	Eg+26XAKmPe4xJ5OM6fQIkPgrEmD/0BWcmvPgNfvuVMTWEnMkAHw+kwv0Xsg0RJajwFfNgX+WfQ
	JxN2Ula4BXxDhsmjWJci+tTAr
X-Received: by 2002:a05:620a:2903:b0:8b2:5cdd:6a16 with SMTP id af79cd13be357-8c6f968fa45mr435590385a.82.1769428928395;
        Mon, 26 Jan 2026 04:02:08 -0800 (PST)
X-Received: by 2002:a05:620a:2903:b0:8b2:5cdd:6a16 with SMTP id af79cd13be357-8c6f968fa45mr435584885a.82.1769428927836;
        Mon, 26 Jan 2026 04:02:07 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c24bedsm28726809f8f.17.2026.01.26.04.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 04:02:07 -0800 (PST)
Date: Mon, 26 Jan 2026 14:02:05 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: vkoul@kernel.org, kishon@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, dmitry.baryshkov@oss.qualcomm.com,
        neil.armstrong@linaro.org, konrad.dybcio@oss.qualcomm.com
Subject: Re: [PATCH v2 3/6] phy: qcom: qmp-usbc: Prevent unnecessary PM
 runtime suspend at boot
Message-ID: <ov6dzg3372zcxsin54us7budvebso65dh3vyt2st7t4ye2iepk@4dsjmhojzyec>
References: <20260121142827.2583-1-loic.poulain@oss.qualcomm.com>
 <20260121142827.2583-4-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121142827.2583-4-loic.poulain@oss.qualcomm.com>
X-Proofpoint-GUID: XAUxoPVXeOqYOIGGjiAxJVRpnikkmx6n
X-Proofpoint-ORIG-GUID: XAUxoPVXeOqYOIGGjiAxJVRpnikkmx6n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDEwMiBTYWx0ZWRfXz1Og58G4nxQ8
 kigqSyHrZEQo6kj0M9/KEiBPM935tIkCUFrNXUlh5WYsD97UhtudAG4aDcyoVvEj1WMArvAHVsf
 h6aHw8kDj1s5q7Lm83w8sO1hmha3+x8qVLzDb7gqpislBTISZvXZbaWJuFMgBo3wMGrGrysuXvo
 Sg07Ef3k5Jb89aLcpuk+571yfAA1BKl3vcXk6G0TLwTHSkSI09fWBSRlnH1EeeAsIo0MEkWqeV+
 6u+befR9jIC5qykDZnoKdhpmD61z/U6cPt4RCdr7DNSKo4+/gcTD0VMcVNzgFtPGZUdRbToCBRP
 6N0V2vZMSzuQ/SOBELnVHft41V0AHdEH5npsTXjSSqeCWTRfGBURZJxYIYGPr7CGuml2SsrQYpH
 SiPxW4yYIlPdbSRjh0H8NN3DrGA7mBIhehxiqUSUmVTRIS6Y6hTJ2lW2cGgYuJIS1IB4ibE35Ir
 TKeouVhk5ke6/RafdiQ==
X-Authority-Analysis: v=2.4 cv=Htd72kTS c=1 sm=1 tr=0 ts=697757c1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=I_ukrOqQsWpVYGr8uL4A:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260102
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90544-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D1EF687F1E
X-Rspamd-Action: no action

On 26-01-21 15:28:24, Loic Poulain wrote:
> There is a small window where the device can suspend after
> pm_runtime_enable() and before pm_runtime_forbid(), causing an
> unnecessary suspend/resume cycle while the PHY is not yet registered.
> 
> Move pm_runtime_forbid() before pm_runtime_enable() to eliminate
> this race.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>


