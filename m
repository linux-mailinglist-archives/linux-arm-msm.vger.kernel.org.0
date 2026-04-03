Return-Path: <linux-arm-msm+bounces-101734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFW+C1ki0Gkp3wYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 22:26:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9E0398248
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 22:26:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0B0C53009880
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 20:26:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01B623D8119;
	Fri,  3 Apr 2026 20:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YsYHRJLI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UABnrEG1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BAA3D6471
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 20:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775247958; cv=none; b=qrzrjTp+NwlI2KvvW10d7dYW//hc4SwLGarwcOEW2Q8K/FFOaezQ4PdZzNv9jp5nGi2t8L8IRv10GLoNVtF2sR3H+U7LqXf7Ziy95WyTcP5HqXSUpvjRnckAw6Zli3qtt/s+TtRrR1TEl42jumPdxTKVtky1KhiWEWtm4LTejB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775247958; c=relaxed/simple;
	bh=hkhtv0vLA94cjZgayqZZKMvkuBiTc8iJOFDFWXtoU/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q5YtKVOG9rQglH0l0XG9xUPepV9/6RWf9W2Pni2XEVlAH0fWIE7jT+2Xi2iGUBgKr2Q/9pIySQsT+NxGmj/vY7B5SV/O3dDjbkKtB2DV53V2oqYFGydOOBQy5DZHGBCB4WA1BVSNBduoe2cEjreWmcarSQ1UD56vDBw707vIGsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YsYHRJLI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UABnrEG1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633BvmnX3780331
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Apr 2026 20:25:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CTmunhIXm0C0mo0B8v9dQ5Sf
	z3cCZwNpzeQtGJNApU0=; b=YsYHRJLIA08W9WkMy6AsSWuRkJfQa0mQ3jD9n6H7
	KUlamPz2juaeSwjbI4FP5pBZXHh+h7bV44t79yqkqj1EODd9p3Nc6OkjSpq9/qWM
	ZlIEEM42TBsqUBIh8NXws9XsNuQcyMEuYwcDa7lqAaQ0i6b8EAqcwml7i6BAuPRM
	0jdgOdQYeFVpNa+bWjcN4+rtMRZfVHLHv5+TmyLt07jIsSsAYHk3p5M9F0EdFLVS
	0jMwV5mm+7fBq/0JfPXJ/xzaFrvz1PVCq+GERp0YU/LH3NfH+tUU3yYgDGCFu2hc
	2nHhmvOYsBvTmDzB5eg0iWXCjhklanAbdK7IyCFe1fg++A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4da663jr0k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 20:25:55 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50925fed647so67866961cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 13:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775247955; x=1775852755; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CTmunhIXm0C0mo0B8v9dQ5Sfz3cCZwNpzeQtGJNApU0=;
        b=UABnrEG1r+0DSY3M2vejMg2+XTbjkX4keS7ZazP/7pDg6ecmxtlxUQsyLxoC6AQYtF
         S9Zp1KznJ0ugDgdVWb4sjJ72CaE7ZQDEoAsO4rgcg3wWN56P5M4aS3dr2a/GGkU+Bzb0
         aGYBQjbl42MciBPgENb3mXxQY3A+TXOKHhbe/Eu7lOqpc57+2i2p9VbasF8/odfYzor9
         9vxIhYyHS5Ij7lxaWxq0g6yOo8xi8J5xw9zHM2SUHPUtNUM1vPmg7rOax4L6qvp2Xe4E
         zlbOJh3JoFjzV9DYscJRJ4MVEzKd8e5a0C2w+IAqbPsINqRETOgaVpKIjFm6sa3PnLJp
         Cgnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775247955; x=1775852755;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CTmunhIXm0C0mo0B8v9dQ5Sfz3cCZwNpzeQtGJNApU0=;
        b=T/GV29T0qC2OZlc26Ozx7lnVHItqKOEdGMf73YRNu/eXtRg1vHbVbPvg7WjTlBdOns
         vOaraDYVU5jJhWjqng3X5iYwSZ2wwo9ryYFLfjD+E7dhv4z1QTqzhj6HTqLaklQYA14D
         6d7C098ZkW26IRQb2nVmEH1VX4LW39VsFbjzmHcgRELIU4a1Gn3K03NiI/OCNdH1A7FJ
         IqOexGbEZePTzlQl21pOPIjaS5ZigjI2FozSeSC753S9oKZQdplhi2dT6hNovgd3Xv5b
         LYViuvrydhH0QZkqoOGVYbWp9+rjsk36Mi2GW/MYQyRqqqciPzOSItLEvKRJwkxhO9Do
         N9Wg==
X-Forwarded-Encrypted: i=1; AJvYcCWZOz4rt+Ats+IhoYW5J8fKW7535SE/bZFd4q4Kg5XAeePbT79Afwt/F89+WWgEs2EoIz8ux3WobtC+8jmq@vger.kernel.org
X-Gm-Message-State: AOJu0YyKki2c9hJZXQlGmfRONs3TIu1GW2MhX7k/4zroZM9xFY0Q7pmN
	Q4AHYzF0clwH6HrnGjHg55qmu7d7VqqPHVZHiBZ3EMC7hp6tAA9t+g0WPSOXCFdtIVx7flf6noH
	ZoneTkdNaQFThDuqhb6bpA+yRJK0RVrenEaQeF+tSnHyQscxEzgN+gWaEZKMcOijpyrbH
X-Gm-Gg: ATEYQzyl5FtfaTJV59gRERIeSwfn5XBF5iXDyRwT0SASYU/SzZKyF9EabgipqamfycL
	DzikzCj+SZvHMYvhzBg6zJek7bdOsZvXqWp5WvTxt1kxpmB2xTIh+Sc+oAPwLGSmdP5J1lvUJQ6
	oGBauUdzeZyJl3vemewmyURdWqCUMf1qBXPCliQ0ggmnoMuNYfQqUKqbSs36268kXvwQyT0sxQM
	t0QUHWTeMbhcgI25QNehuTgAPFoyvQbM1v6uGyMaJ8EHnmVTUFaKPij6wP3kz7cg18/c3gYqfk+
	fJ/mGDEyyX5Qxr9gAc+OXsorQ1XGJTgR90mpM7RhcvBANVBXbVCMVu3lL5QbCNQAfsN7gKiW8e2
	TOP5SFCoJGz5HHeGmWq0jBrc+n4wwf21eRSYhZkbSghmVvqtfGXRE2InOFkre0lFlDJdG9W/DEO
	EaUx+IbGfwfzTl4LMipZnS8eimd1RLNrD2Q/E=
X-Received: by 2002:a05:622a:5c89:b0:509:2618:cefb with SMTP id d75a77b69052e-50d62cc031cmr64612761cf.38.1775247954876;
        Fri, 03 Apr 2026 13:25:54 -0700 (PDT)
X-Received: by 2002:a05:622a:5c89:b0:509:2618:cefb with SMTP id d75a77b69052e-50d62cc031cmr64612541cf.38.1775247954489;
        Fri, 03 Apr 2026 13:25:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd21076aesm14487311fa.19.2026.04.03.13.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 13:25:52 -0700 (PDT)
Date: Fri, 3 Apr 2026 23:25:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Subject: Re: [PATCH v3] Add remoteproc PAS loader for SoCCP on Glymur DT
Message-ID: <ghd4psugqtmgotr5j3754756dvdmlnxtvuefyjrirfwe26lvrb@47f3qinh53sk>
References: <20260403-glymur-soccp-v3-1-f0e8d57f11ba@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-glymur-soccp-v3-1-f0e8d57f11ba@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE4MyBTYWx0ZWRfX8TeC1hvKqkXs
 23Er/bh/ze6nmSoGL7tGjr5xw0sxa7+ZsqYQ4drCriNXVDdxr7EgzyOZxb5DJaWL1G//MHi3ooz
 rhDjSqGpVm3kEtbH5WlFAILKIBYinrYTZ5oe38kOUx+rfLKfVUuS86ygGjVFI30rUMAEB8jeai/
 m/4W80gXUOIbpaPKqm4Wjg/A+a0aXJgVmyB1rj99Kx5K4iuU3JqwhwQEbt8OYKRiiVtNBCkMUGJ
 QVffYL0aqLfekRxZHgI3OCgnhpurwYwoFLOH9LsOIJECDCQvsq07exN5MOs7dz6+rUvMrbAIq2M
 AAzgrtfaQErVbu7KwrMFCMRIJYgSqfkhQPTkAdPtvO1dinF9TrXT7iLgdWtZPeTvDn2q5SpEmfW
 MPH+puwkvDZWE4TNeM4EMc3SPROkOQo13q88Vg0Q1FIaUqYBC58h0o1qDbTk7ojCmA+HtEP0w0Q
 70mOAyFJZhlIyxQzENA==
X-Proofpoint-GUID: YiW9bvoNbmzQPtKZzJcSpGYolxqaTlQw
X-Proofpoint-ORIG-GUID: YiW9bvoNbmzQPtKZzJcSpGYolxqaTlQw
X-Authority-Analysis: v=2.4 cv=Acu83nXG c=1 sm=1 tr=0 ts=69d02253 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=Y_bj1bYQe2qCW0vrO7IA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_06,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030183
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101734-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BF9E0398248
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 04:39:05AM -0700, Ananthu C V wrote:
> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Co-developed-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dtsi |  7 +++++
>  arch/arm64/boot/dts/qcom/glymur.dtsi     | 47 ++++++++++++++++++++++++++++++++
>  2 files changed, 54 insertions(+)

Missing commit message.

Also, as this is adding SocCP, can we get pmic glink device?


-- 
With best wishes
Dmitry

