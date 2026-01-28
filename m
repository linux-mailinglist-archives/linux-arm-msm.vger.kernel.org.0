Return-Path: <linux-arm-msm+bounces-90913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FmCFIPIeWnxzQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 09:27:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4629E30F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 09:27:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A93B30097D8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 08:27:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF3A43376B0;
	Wed, 28 Jan 2026 08:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ExfT6jRD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S2RpV0HD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759FA32C949
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 08:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769588861; cv=none; b=PkU93SnNgg10HsYPPE8CNPc93Ql9ym7neVw+S+BDlwIM5bOd5xNLmldSil3HI9ffUdIIfcLWAC+g0xvgOedgrSK7fgW1ICpVOeK0JJnX8JiFQPD+IVMTHs1GbfX6HhsTrH/vcuE7bqX3rUQEAWd7nkjvXi5Qw9dFWX/CMMgts+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769588861; c=relaxed/simple;
	bh=kpveHU+X1lFjdI7AcKZD7lzKt4jCrS/Y6epQ97Hei1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NeaTse1r8CSn2ZLmRzti84rd6G8qfVI1Xn2pw7VHEV/bw/sJwNbi0vspFaNp9ZCDjI7jPsVwmGGyxUU3zJa28FCGBmOIy6OrBgO1cMslmMWNtdZKobF02ont1R4o0JTmHd9BApUIYt/PyVtZBUtT7oHmB29tetFgkZIwb6Cz2rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ExfT6jRD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S2RpV0HD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S6fFRm2952591
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 08:27:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cfH8xnb6PUnLEV9e8I1zVQbJ
	iQywxWkoNny71+9vJtA=; b=ExfT6jRDv3EgIjwZjlUFm0xn5tKxCQ+1/FropoGN
	ECRX9UytOe6YURxlWGD8YxbB8YvDfsI6vlJIHuAVVnIDo83XhoOUOGMAzzvrfJ4w
	u5bYfKZ8qj9v7ETxIBgUx1SE+1HqcrD5cg1AO7zQMBE28DhgJg4upkS6kdTFjh2T
	mVQVxKNtrz/Db0Cv54oekRnQpQ8O5C4UC8cBbW1ifB2FOxglDBS0IQ/1K8unywdX
	hSMnNpahElhn4myianipujq0yvq4ctpHtK6aUBbvFwdyWRrSP21J50cCozuFcHhh
	Q5zU+IKCbzgZwMdivjD1ZtNQ7+OFLf8wHGyC5AKlqZQRpg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by4sjsv78-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 08:27:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70ed6c849so272697485a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 00:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769588859; x=1770193659; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cfH8xnb6PUnLEV9e8I1zVQbJiQywxWkoNny71+9vJtA=;
        b=S2RpV0HDC4ZpfxAmC5paICxc4kR4Io5htYVoidn9gDSq3LT6mctxn5wzusF0uw/EEa
         OwhQB0mP8wMMeKvT8+8nDuCRD3wQdF+BCB7pRG1CqUY3qBixrVPg0G12jpqrj+u7mwWo
         ZSqp5AM9NxulB8TfXkcu2SJ254iIF9z5TFdjP6yLs1XcBQREW9zWY2nxiSF8j5xQaFeF
         oL0XRaS6EFioBmXOdjzBevSwU0VVAVJn7n4h4wLPXVvQE7HZter6wKbFKAjfnTTGT78i
         c+MGLGaw++MwUpF88096Ywzefijrw5fRA+DCopJky7AYgCdNJNkrKtElg9y7d0AuxW+A
         nauA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769588859; x=1770193659;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cfH8xnb6PUnLEV9e8I1zVQbJiQywxWkoNny71+9vJtA=;
        b=LYUbQQNo0AIXObBWW9ok3335PsSrSTzsQlf/e4X5QksotPJOd2WFXL9XN09L6CgtTv
         SlQVphdT5vGOPKuBKk6mALigP6ssMMd1aGLHEVeI4epvtkHplkn3S5OBlzbqlCkFKEk+
         53jqKODtzFv7C+PgcRdsgiMZjVBKO0aF7I+U4P8XRjv+YA9hzmGsLHk1iA9iNja+1DSd
         two4/mZrgkHQhffxlTO9qJ4l1JvxhhPuj0FMhcUpnZFQjH8VBrF6FL/FvIQ1JYPc+PTr
         AIxp3FBWi3tj8WJ6nYLwcyL0Dh57jpJTWxL5/Dsq4OnhfkM+26+rOvx0Em/bM6ij7Oue
         0xug==
X-Forwarded-Encrypted: i=1; AJvYcCWKZXvzYsAfLG1esKh7rxh0oaH3f26mnUisuaV1Ccw5qKSd/4VTEiEEhZwr0sObR5QrjxJ5cHFv/Cu3hLxF@vger.kernel.org
X-Gm-Message-State: AOJu0YxK288Ne3OE5fWDEW4uBOSy2GrCzU3fmuiW1w1Kvx1vKrNkgX9W
	ZDXWcaNg4hwvSaAJrjkvIUjCZkKXoovU7DrBZeGslTxXeTo5yqicT8JB7e7CCR7FKfXBtN5RkYM
	KZkYHbtg3jbgYA1meJUI6dJCOhERfKXQv25wsdFV2DdajGu/l0tbh5e20sOieqdPoNjo4
X-Gm-Gg: AZuq6aJcFwtCJbVEQVIOnhiH4EtUM5bzR9E8Eog72cGftolSjc7Gtpynddys55bmeQ1
	toLvvXzvZhjxBd5le291gi5BSEtOUW4xlM4w4/c4SrK99IkVX84Ke3285n0GK0qCh86NRe5fGM1
	ZANvU8N2wYyMOZPq5/iTacrVw5BqE17gCTK+DA9YZ64xYVdfEmqf5pQ1X9OEy1nwLryrejlXTBv
	PPcUwsd6FHgdZMr0qfXdAV1VBYTlwE3wQFonOr1Alg/vkNxhGANJ0TJMV6oKglsK69RDD5bvt/R
	O4ZhmsE8a+kA6XmMbZMKn9M7ElyfuDnDFkPJINaF/n3DFNa1uOKcVJuA6ZjmkL9rkUPCbMt5y9g
	M1XPd2pBYiZLdbxW9E03q2yOv
X-Received: by 2002:a05:620a:3d07:b0:8c7:e64:3dbf with SMTP id af79cd13be357-8c70e643f9fmr363997885a.87.1769588858452;
        Wed, 28 Jan 2026 00:27:38 -0800 (PST)
X-Received: by 2002:a05:620a:3d07:b0:8c7:e64:3dbf with SMTP id af79cd13be357-8c70e643f9fmr363995585a.87.1769588857995;
        Wed, 28 Jan 2026 00:27:37 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131cefdsm4939547f8f.23.2026.01.28.00.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 00:27:37 -0800 (PST)
Date: Wed, 28 Jan 2026 10:27:35 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        20260114-knp-remoteproc-v4-0-fcf0b04d01af@oss.qualcomm.com,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 01/10] arm64: dts: qcom: kaanapali: add coresight nodes
Message-ID: <bj4edohkjs73hn6lpzl27jnyijfe5bfkd7gfpkodan3u65d4b3@fd2mvvbwkdkd>
References: <20260127-knp-dts-misc-v4-0-02723207a450@oss.qualcomm.com>
 <20260127-knp-dts-misc-v4-1-02723207a450@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127-knp-dts-misc-v4-1-02723207a450@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA2NyBTYWx0ZWRfXwwNZrfRbJ03u
 rIi1eZ0wrDWM2NOBxjJ2sx9XEjBsvl4RiflhQflmss9I3Hy5R/rfaPXHNXhVytJopiJOfOxZz/Y
 uB/X2I+x5P+ViY20gcvR5ngarIO4S3N3+tp05UhiAoQZsen54LcX5BN0/aJXHSpjabD5Ys+GAL6
 QHtUvQr07RRZsfXyB0EIcPr/9KQiX847tlwr9C4G87es2FLikpYfWlV1eTR1RHninKtZqTuXFFs
 VuPU9az5XlaWQu2VfMmgjGE8kC2W7uIgzkL34LPHs4kN/zI/Umc6atxpL9znI315ZXkcA2acnd+
 kXM8igibe5UGxTSExfwa0nhJ7fQmJmTre9C8vSYYuS0mfbvcHg9jJP7y3zHZD5aSLk14Zog2xcw
 7MEcYH+/OPzzqO0ZVcb92Nc53Tu5sbIzhXNSIAcL5AzcFU8mDNmrNQy1OwqiXCRVFfFGa/h70zn
 cXnF/RPKFiuPIXiGXog==
X-Proofpoint-ORIG-GUID: yd17JZYB2WMyJS4jFm5DugRuI9x5Jcec
X-Authority-Analysis: v=2.4 cv=KezfcAYD c=1 sm=1 tr=0 ts=6979c87b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KwhAQRRhPyZe_uKFgesA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: yd17JZYB2WMyJS4jFm5DugRuI9x5Jcec
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_01,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280067
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90913-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AA4629E30F
X-Rspamd-Action: no action

On 26-01-27 00:33:58, Jingyi Wang wrote:
> From: Jie Gan <jie.gan@oss.qualcomm.com>
> 
> Add CoreSight nodes to enable trace paths such as TPDM->ETF and STM->ETF.
> These devices are part of the AOSS, CDSP, QDSS, modem and some small
> subsystems, such as DCC, GCC, ipcc and so on.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

