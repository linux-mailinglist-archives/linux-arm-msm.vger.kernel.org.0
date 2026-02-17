Return-Path: <linux-arm-msm+bounces-93148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLS0OR9ZlGkXDAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 13:03:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E65D14BBC3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 13:03:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 38D23300F9C9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 12:02:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A88C9336EFE;
	Tue, 17 Feb 2026 12:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VUPYeLHH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e0yjOpQP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF883358C9
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 12:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771329774; cv=none; b=LrjPXMMpOrkKMrc+0mYKutZ/PYHfVlR7f3EtWlXHFbMaZyc4/C/NW+v+rf3qUWwWW0kayNId5QWKpsvnriBdIu4v7ra8H7ekoVPF6Q1PrerSEHQsWs301O3U5cWeIVRhyTSPeAV9HrLrIedZlVYiqYJBzWtqDVhqsY7HBW5NLUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771329774; c=relaxed/simple;
	bh=n2bmmKQTZ2vobkDiAl5wpyNkx9wE5nybVP2IUAzL5Co=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YdunJtnnAilY45b9aEvzajwoyR6ZqNvBuakz8LXBqui8/VrQ64xtNIc5DXvxUZ8yzIHCOj4cisZQFIwNbhRnM/7olDddm1kutnA/DakAvqT5uOrKvwZGF649Y+VJ9sqx20p89K5/DNDNWW/hcH8hv2Nabdr6jTAmPogEbfnDdJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VUPYeLHH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e0yjOpQP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H9TJAY985361
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 12:02:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bGm8YJF4G7QYW/qaOMM2c8kP
	NYdqClawZJbczBsbutQ=; b=VUPYeLHHodmnO2Q94yDbR2HtKNHWLFoB0NS+M8S+
	xibBsrEe+RcZIv6wL+LVdqD8iVxRUdUF7mUdewT+EYw7Ruv75ieaVUArCEKdrGzY
	T1k5X9dtJ5hXJgt/82YWaT0Ll09Na3BIDX5DiKWmrRQciyrznTruuyJBL6svacbA
	6OaeJyfgnQERYTSIAWvkUeAU1h6wJRx6FpTdnv0+Wc1Xt2+qgfafad9s8DqE7u1m
	g26CVmTN3N69RejXypCIzayI/ALz9FmAwQRKNlNDybpM2qabcTTfadVmb5153B6j
	e+5AthgUFRJXTeLnKkXknzGoo1FKlXSoRNag06IemHFuQQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc7ap24ab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 12:02:52 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8954adc2173so689651446d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 04:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771329772; x=1771934572; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bGm8YJF4G7QYW/qaOMM2c8kPNYdqClawZJbczBsbutQ=;
        b=e0yjOpQP2Eu5+fNZSj6rG7+XQSS+POt6MLVnC7TyFMMWlwFBgwDRlZ/Tj5n3uuriMQ
         UDtRPp+GK6Yy2oOUq5BIkJt50YZ/EBiodhFM0u9qPlzeJ2CZcRUq3g8QDtGQvWAPoSb1
         5xMyfJrOG+OPZJ5/X19hjHJ9RivPEX0aHbM+qKWvMc5QxqxJk5VRiF2cie6RdoXhpeRE
         dnrraDy/9HyYq7iUMnR6Gt59uTBZV0roRiFH6Abstp7enHw59DJMr/ptpUF1y3jPQ4Z6
         DBmZnrysP/Agc3ZSG+tCdhZgu5bNUwEdm/S6xACngPl4vgJb6yMRr58afsxhyjktFE9j
         DFKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771329772; x=1771934572;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bGm8YJF4G7QYW/qaOMM2c8kPNYdqClawZJbczBsbutQ=;
        b=nyj1zVtPwvxC0wwFxicJmWcbzzD+9wkuDds1hdnlwMaO7i3QsGzQMgjlr5LNYYXC/7
         TBgk0Bycg/OrvDV/6cqyLnhx1TOhATN+BRaIuYWBl9vEtqL+2ODF8yBx7CWnR/FcJoI+
         +UY9fyeb+JQGuQA7Z2mhKJ10Jo+BymMwb098kgr3luvyVljaEagJc2X+gOZTzw8wfKHS
         BGV+UWZhF3umunAOYa3LNvK3QsnpVXNYEfWBS6HjT11sa2VqZWN8gCbvgAvEWYcfxqmm
         ch2eesrbqZW6gdPfsehj+Z6f0rrwROo4Ldz3srNGnVcHhB+bne2AEQcsYTsqLU3fWMzQ
         6WCA==
X-Forwarded-Encrypted: i=1; AJvYcCXh6a49tgePTrwmBq7yDC4vRUZSUI/oVpIR+iNJJVYPVSYuGMHAJC7O/wwO47Et0Ghe/MtBSNF5/Ob2LCih@vger.kernel.org
X-Gm-Message-State: AOJu0YwiQxjSL8A8cut+n3MUwe3Af9ckVhmMRMZ9lvnFaj2S3L0Sxi8O
	d3d3xiBsG6219s8VLIZCtud4QDsGbHaSNfKKYmvnGAlLE5krNDmOSmFYdwEySO3PbMKCMsB8p7D
	MRhVaj2/OqPsWKc+idgsRKN/pke7KI+TOXZiA3gc7H0P8GHNQBHAZJALgvWCT2hIXGcrE
X-Gm-Gg: AZuq6aISR8NB8iFXDNyBtva1feQ4h1f8T7P1akrcN+cS/6/3EtjkLm3UU0aZv9nYIMC
	uZRGbOtlHQhazEWMVHTqdX2/P2zmIGhEjcE+mFdLXJc5NIDTh8Vi7ZKPeAJDr0LELX1nLxHWLhl
	lBelKpYvUPuB2bRbnTnSfJ93Fke7uY3sEh1ypDgh/drmxVsW5fNcB+a+rv2mxv9CDmcjkeMIdLv
	ZLxa+uXSGaoENN673GB0BKI75tH8RcmpLcC7B3gouvHC7oRc/vE4akA0KRu66QeLUz0k+ODQjeB
	RzKJvCH/4EhHcVvWEvYP92YNCzAiegJdm8o+NAsPjn5eqG1YnRgflwDvGs/SYUGKqMfs4vgFEea
	B7Cnh/DlWwFuUfhqID+LkOdwGnpR95uFvAEuW
X-Received: by 2002:a05:620a:a508:b0:8cb:4d9b:6b4d with SMTP id af79cd13be357-8cb4d9b6f20mr1040224085a.10.1771329771897;
        Tue, 17 Feb 2026 04:02:51 -0800 (PST)
X-Received: by 2002:a05:620a:a508:b0:8cb:4d9b:6b4d with SMTP id af79cd13be357-8cb4d9b6f20mr1040219285a.10.1771329771325;
        Tue, 17 Feb 2026 04:02:51 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a5ac92sm33943836f8f.1.2026.02.17.04.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 04:02:50 -0800 (PST)
Date: Tue, 17 Feb 2026 14:02:49 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH V3 5/5] arm64: dts: qcom: glymur-crd: Enable ADSP and CDSP
Message-ID: <v3fxfnuvkgxvvqmiejtemytw2uysbbqtdlmsn3yvojkep4jual@n737hvkaa434>
References: <20260129001358.770053-1-sibi.sankar@oss.qualcomm.com>
 <20260129001358.770053-6-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129001358.770053-6-sibi.sankar@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA5OSBTYWx0ZWRfX1DFulwZ3Rj/y
 daX2v3A/C7m2hJASsl1WqvSEsa8t4GZjkUdUuBkOKJR6ZI8vrRfkDj8mqwx6Z3XY749nKasGOjB
 oFdmbRxZwuqyRP29PbJgi6nOiqVG3Eav1NtGCRXvrZkIzIc5xmahxZY5XhVL+8nAW7m9WoKoqJO
 2XBXQfj0JRd2+JTRHSZD8g3lgRzZIt19WsBSRhbZ0Hv6hm9ALPueQxmzqnDDt/hLrwsc1nV7p1h
 MgMZIzaZo2JA1VI8L2BDWdukATNbMFL0TL0oCzzh2CaJ6e6aUFochqIhSLmbTnCicsFtwaw2Tjm
 hiSqkJXI8FVs3pGpLDxRcT9jGCwJVM4zko5cpY+l8kS6/3U3Rhvnod388xyXE2pFS3zr3HpEewi
 2W5QMCDkRU3vKjravPdhUzDJ3X84SiYpc+st5DPpjZRwYuzZBedwNNauaAnN+OkLC0vODv4BF0o
 g3o+wETeCItVSKsixtQ==
X-Proofpoint-ORIG-GUID: FTPku6LdM9zh_qPbSrfh-vR2ZCMNH5O2
X-Proofpoint-GUID: FTPku6LdM9zh_qPbSrfh-vR2ZCMNH5O2
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=699458ec cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=IccHdx435YTdWfe-SmwA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170099
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93148-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4E65D14BBC3
X-Rspamd-Action: no action

On 26-01-29 05:43:58, Sibi Sankar wrote:
> Enable ADSP and CDSP on Glymur CRD board.
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

