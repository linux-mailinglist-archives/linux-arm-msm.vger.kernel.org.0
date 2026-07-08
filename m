Return-Path: <linux-arm-msm+bounces-117633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +NUSFENPTmpCKgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 15:23:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACA0726C39
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 15:23:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NCL46f7Y;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=aPJiuvXo;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117633-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117633-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8BE94308F9CB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 13:12:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D17252D6E6C;
	Wed,  8 Jul 2026 13:12:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9041E28C840
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 13:12:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783516333; cv=none; b=Bo5c8LubiWKfEGXIJZLYMRWYQnc62rpN/bqzDC0TT5Di08zA1fXK7qS4dfDDc03Hc6SlNmO0NSEzWEsh9C9MUbGRHpZ/U26hHftypJeOjHdjvwj8asv1zwZVJEf2j7F1vsiba+pyPqaTDLqC84vbFc1RDT9pWTp5yzxms8bH8nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783516333; c=relaxed/simple;
	bh=mtNvqTnneUBqZDhi6ibMlCIzwScmNxakOjWUTmtKQ8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QttQa2bS+394Wu2oIcuq7ykhfSxATA5BobWL03vq91rvTyrCmuJ9L1uIOZbI0no/uI8Ml1T3SoQwtH3b6SOnmcVLPZ0UdnvmYNc5wm5q2ma905rAR+MUoVoj+sRRIA7SfTpSNKHjuIz38/JRc10Ztmqg6ALHz+nSBihrSEwL4gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NCL46f7Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aPJiuvXo; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3AEf2736275
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 13:12:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dAwAYHVJl3E4TbI2VVqjdHsn
	zZHTiYD97XQNhoK7O8o=; b=NCL46f7Y/KqtocsWLCLwgUh5LpsDujAWMVfQvpA7
	lACOsYf14U66B9Z24CzPiYj8yYIWdHqeDUZ4ZddLeAduA19SgQqdMQcrqLux3UJG
	IyNY3i11me7h8+Xk7rwMlP+Yp6N/VAM7r+dw1D2N+8+8cCctfwhbS4q70Yjsc/p/
	fwjOqqg0D1h+Bi2Uwi+BrvgBSxebJDlS1e5SAXJTgRZD+cxu6k2CXDB0HydDbIHp
	o3NAxfYgH6RT3gnWpJSePco8kh5T7qDWL9LfNulbbk0f3DK/YssT+bBXxRIXH/wd
	Y7WGWtjlbOGuQ2/cU+uvva9nfDYXSzGaP4kUB5xrHpuGyg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9hnv1ds4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 13:12:12 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-73a8aba30a4so649121137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 06:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783516331; x=1784121131; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dAwAYHVJl3E4TbI2VVqjdHsnzZHTiYD97XQNhoK7O8o=;
        b=aPJiuvXoJ37+EGjxDwbvRI246wdRVKAGuhymTkO/ifOrn+IJEMTeOCfBDWmFcAY3OQ
         8lwsITLF+qz7pmpwnUjTruIjvO1TjjhPejhxhXBGA1g673SyPjsuBF42oWQ9SgEkDyYA
         OfSFmvFEbUtvMDJwDy5cnJmGx2nfqTXpjU+7u0Djgt6A90MY4gfduDlzznjV+EbS9Q0o
         k6G/FsRf/Hl7vlwJkdeuMCZ+R9wy8f3oMQZts13ov/Qtp/eSKaaCeqhUVGQhr6WiixK6
         NqUjygmobH0Eh1CncmiQ/H1LeU+46BGNubNgrq36HLgb6UzMsoNhdOBOu4Dne6PqvRwo
         Rj+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783516331; x=1784121131;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dAwAYHVJl3E4TbI2VVqjdHsnzZHTiYD97XQNhoK7O8o=;
        b=ARfZTbdG/IgHwuRMZyZa5noR8od7Jy9a4oWjB/1GQ68BH9pzD5VAa6oGo+FC4Qtrhy
         xcAFJ/Qiz0ZbJ9b12cetzBoIAHQ3o2KWsR5FF5bkxtOJJ9Rmj0kAoH9Cyf3x8UkstYEE
         eznPgfv+hGYgly5qHsHCJgSAFxjxUHmYk3CIPTjJ0g93iOCuqLcf5S5Z2Cr78oO+dd8u
         FU0NFhlyT6mbe7HZIy3M/ED6NqPXOlp9opaixgNAxfHrsnuBkFmZWPS1k5aEf8a8J8L9
         gfWhAqRI2/j57Vyd0W51wSn3eu5PkO97RbBKFXE/sceyxsD16DcojuFw0OQJn8X/VBSK
         a4Sg==
X-Forwarded-Encrypted: i=1; AHgh+RodFWTvuzmxAGzqcJsMgaGkVxWANEiNIKkd96jE0iAhL1o7asQKyMHnDLGbUruHSj3rXQeBFurWmrDovaq9@vger.kernel.org
X-Gm-Message-State: AOJu0Ywbu5w/XX8/qb1kcdZWJ9Uo4Vr2RYTKHA+r/YNv8OfB8tGWgFHS
	pRBvvhBzPbZe23M+XM/9lXZtfvNIx36dzYnMTgBgGkTNMWmqRmz2/zgCST+XB0zQDrOxotPAwCB
	Vwm2sED79rJEw79XE/52msgweZ1TMZj4cXMYRMw+aPx0SvVFRdjJBd+KTK3Teie3iP4bj
X-Gm-Gg: AfdE7cko8bBiSBSIGob9F2qz3hnmoW/db2KlYzDvJ7YSdK0M0oVSQ/mX7PNvRhB1K2z
	r4xjH5K0aanWsXTYtHAmV+erXu83QmpSBJHjFchx5r7cUWnRwjOauCcB62Fij+90woc8i/Ez29o
	MDXU+fpUDr1b3E0kwy9tdDEfqwhEI4xkaCEKsP+9t2KfCwWbWfy2b/3/qY/LLwaBHl2v5j3UhhK
	n1tcNfd2AiSPfAIMFKyy+H7N3rfpRLqCxwStWdqVTVjqcqWjNLmqZwyRf8X5TQ135SZDx4JCPhe
	c4VC4loxqlNyO6DQjgf3SXpH+bsgRFJCbNCI/5qW/7/pom1Blkf2xkUM85i+V93U5JTZfYuQruW
	FMWaw/uhgISVNtTkg2/TLlzqT6/4Vm5XdLUnw2VtBvdLfJ9m9ETwlD6kSIuc3OR7gKs6rRI3llr
	mROcdvT432pN1H3Zwk3eZy2RkF
X-Received: by 2002:a05:6102:8350:20b0:738:f27:43fc with SMTP id ada2fe7eead31-744c214b4ecmr3511539137.2.1783516330902;
        Wed, 08 Jul 2026 06:12:10 -0700 (PDT)
X-Received: by 2002:a05:6102:8350:20b0:738:f27:43fc with SMTP id ada2fe7eead31-744c214b4ecmr3511520137.2.1783516330413;
        Wed, 08 Jul 2026 06:12:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bb685sm4472877e87.46.2026.07.08.06.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 06:12:09 -0700 (PDT)
Date: Wed, 8 Jul 2026 16:12:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Matthew Leung <matthew.leung@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/4] phy: qcom: qmp-pcie: Add QMP PCIe PHY support for
 Hawi
Message-ID: <qfqxgcjau2x4yn7xuviva2cdlvyxn7gel6bcj32pj4mtfw5ngr@g2edc6d5tcu2>
References: <20260707-hawi-phy-pcie-v4-0-8d9cc6324947@oss.qualcomm.com>
 <20260707-hawi-phy-pcie-v4-4-8d9cc6324947@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707-hawi-phy-pcie-v4-4-8d9cc6324947@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=KNNqylFo c=1 sm=1 tr=0 ts=6a4e4cac cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=_DP_PzDrpJ8qHd2sDw8A:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEyNyBTYWx0ZWRfX1WigEXIR4g0E
 eqjW9hdFBtSd/18OSL2w98bLF32/FW56XsS6UxlJ+lSY6RW5GjzQz7x/rfcR7FFHUaoUD+auIDj
 gB+p8L+VUOuLQ1rXeVFDf23bWtzvMxw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEyNyBTYWx0ZWRfX+ZVBbfz12KuN
 u4GlRU8o38NT9pTivZhxMd6Hldt5N3IpfEfdEhIEZyud42yCM4F+paWvIGTtx2pUmGtzBmS969p
 lozqd3RIL76RYkzSr4Z6uZH3icFezYuFpBj74Qg2NHsgSuaQ5lExsFCkvxNhAc0KEbuPu7YJ7Js
 O7EQF49qblkNKnPE+ZsnyU19BUljZSKQzYnsXHGTanAHEO5jaHaCuFUlFZg42H8Jr+lX6sSCjrA
 mGg0Z6Q/8IWmD4rgkhWrQMR+jDrDKd1vlzfTWvKKy5NyxwGyn28qWshxn8KHw7XzjDnOMX7eAHE
 qjMlWXDF6o+W8t4VQ0+jMF71mN/Luv+YuSh3NJ61GbhKHmot8L/5TIiJlKtcebEBX7G4s+3mEb8
 eCtzF9k/aASnqKFF/z9WsYU0Cw/G8mED8s+1ToGCswatM5HpMS3BFZQZxYYZavflTE9tnyNqUKy
 HW1uXLNvg4xbduTy4Qw==
X-Proofpoint-ORIG-GUID: DR1Am903qBQIxSrx3ZR7_nYvXKDpI8j6
X-Proofpoint-GUID: DR1Am903qBQIxSrx3ZR7_nYvXKDpI8j6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080127
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117633-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:matthew.leung@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5ACA0726C39

On Tue, Jul 07, 2026 at 08:32:49PM +0000, Matthew Leung wrote:
> Add the QMP PCIe PHY support for the Gen3 x2 and Gen4 x1 PHY found on
> the Hawi platform.
> 
> Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 373 +++++++++++++++++++++++++++++++
>  1 file changed, 373 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

