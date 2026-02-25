Return-Path: <linux-arm-msm+bounces-94183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HmiF71Kn2lEZwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 20:17:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F338719CA5F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 20:17:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 31D12301410C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 19:12:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 161A33EDAC3;
	Wed, 25 Feb 2026 19:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WCm1INdN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OIxt7NQi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FBF2DA775
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 19:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772046740; cv=none; b=KD/hZP0JIa3qnZQ6ma+gz+P3SA2J1pPDa57iA1rihoNtGDQF7DNEPZ6+CdKW1yKXrihju2vj+7e06ZuDAHemvT0eAfq3gFzovaGm0S0WZdMrVenWye1m7lgDQq/un0KPUzE145hooCB5vfCxAmUXg6IGP6PrsrmlOEDWliPJbms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772046740; c=relaxed/simple;
	bh=3UffeSYJ90UKEt6at8F7y8k8ed5aDBg4BiH/dDRiY2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WTFUokCWOBKueXtUDpzeTlyjKGeApKFrXwQO6n8nkpqquhX/BlkfecG40Ty7Zde+M6qjgyMAjAiMDu6cxI2UETHZINjvR9SoSVaVnBw4eriCdv86C3MH8w2HKaQTZOjtDNO2Y9hU82gWrqQ9vYsiEEBZvxv+763DId49ea6IQ6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WCm1INdN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OIxt7NQi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PHawxi1363691
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 19:12:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Lg9srVmRK+oZJLWJq17xoEHm
	pPxqRtxhu3c9PChBOMk=; b=WCm1INdNRRhbh84DyjMSXzpeUoIeQXVsQgHBlF1h
	Ndkvbhvx3lXr7E9lEF/C2lv7P1XNL91hKJWoBQPh0Ju3cQ8qDmL8N4hvHi5mx4Xb
	xpvtgujVzIept+Zev/RH/7hr17o5f9CCDpLLq/c7ZicXw3Ga2LdzZX3eXzwD8av9
	9hGSbTuWBNDjgYpAJRgqznmnbhInDU8kIHwTTvMK007WXU74W2nrIUXjgZRCiyr8
	ZDgLf3CSVdKV8UTUfhoIJCPhtWkXt+diNrnOdGZ/33Tl3HfsLLImO8fyTA3KdLeB
	qw/AJbDZk+cn0Otpvkc1kuFzAmdGKQy61y9ZbdjiYvRPZQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chp15b9nt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 19:12:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70e610242so5855846585a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 11:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772046737; x=1772651537; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Lg9srVmRK+oZJLWJq17xoEHmpPxqRtxhu3c9PChBOMk=;
        b=OIxt7NQiEcxBnvzPuX+d04UqICKMVDJRR1azYUpyuqDA8VQ0nqLouPkmuBlD7lr10A
         4M8syQClZN8tTjxVaYS0pETgCWkPZ47BQaQX2TaHsMuzmk1MpOp+Ipj7hZcysY2j17zU
         7friol3a3M5cbYkzA6mgHX96JA11Lt0+DB+3nDf2eJ9DhyHrd7QHVdP2SQ3riW6x5/44
         oDqJ1cCpyl/nwGm06etbRruWzZT7fp/7mzPhwj66FJamQg5QUzjti6SPc9PZIRIfrWIf
         1xYI3oCGAzy2eGi+amS6EQYn6ZZ+jsUHmwAEk/DAc1qB9jBp9S/fYQ6iKgHex4+DyqCv
         O/lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772046737; x=1772651537;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lg9srVmRK+oZJLWJq17xoEHmpPxqRtxhu3c9PChBOMk=;
        b=kgehBZFTBt+zU/IZOz4lIxhqgYx4z5Ce1Y8h1l7Ur1bLOhvN5i8QvyIPHJ+AcZvYg/
         EdegsvBylWs2tqTJwADkMw9i9FNiS5YZ3Kd2TmKRAM4uDBFcTmtQxlhf4/cPzeG09wqV
         Iv96AjGWtxTVUFlqeyYQHdG5jNe9N/ojwV0ASYeA3FND5U+wVeM1NZV2++YRp0GDiyEc
         WlrJsQmYZ8ivV8N8TQDXzIAnZNogCfaoEjeCDeRXEHWrwVvl93uZNWCljt/mA033uY8l
         h13c9vOOmY4ntrk7tpMhtJaUYeUdxwzL6m4PN+q3GdDGECr7mCsb/f4NWskjcA8A6awN
         9+9A==
X-Forwarded-Encrypted: i=1; AJvYcCVtHyR9ocCZX8QzAPjxbzH+OvnzhRmfGO5f9KowZ6Ua1LxF/vVZuwWB7//4VyYW/Poi9P+0KX95KMSPdyKH@vger.kernel.org
X-Gm-Message-State: AOJu0YwWMHkSisL8HeZGHHyhWcFQveArHamFD+mPz8i7yE8PLn+t6gVw
	KZ3lKXY+io8l7BNfKStSH70kidASmDsFsw9sI8tUkYLbiS/1ZcMg/oWL1WxMissXpAUIZBzaJ8p
	LbtFJ5jjaXJoWGdlRMVc9UoJhToHnVaFdxA+VZadZh67boglUb5QK6NnT0ICYrS6nKiRd
X-Gm-Gg: ATEYQzzvG6W74kCL+Bng15LJYxTG3V7hdUApJysSF2AsaxOWvGraGqZjLbOJd59o1Au
	dckW3fla1YmX7dqSzBIEiCfZiS9tcIA7kIUhKd6MLavVg07i3jeLzU9Lql8JBRhMLECASnj/1ZD
	H2KzsZkK3cgxJK+zgb3vp16rhIcoqXd0YR38eQ4f+OiPXthSNV0SQHfAGKi/XlN155XrSYqvX5d
	bPJ9LEIPQGNEboTM4WBOagmcQpmEIdmQ2OWQ5ZIgR/DbAltViuqEeSqfVEk8WMUCdwQ4jH6PVrG
	wS55+zC4Ls7TO4DAH2ep0LqmHre0he3G0Q2c3/bz89l6FpPj7tU7FWscDs5OR7i3j2Z8TAuIsa2
	ii3lQKEldUin9OaAKJLDpBwD0TK5DzO2AcbWqXf+wfbZs+RPyqQJ2OBCa4BQAW4+CCvhY4e8C8M
	nprgRJrDt00buGUUAY1XG2/FbSln+7FNijaNo=
X-Received: by 2002:a05:620a:440a:b0:8a2:ee8:e7cc with SMTP id af79cd13be357-8cb8c9cbf76mr2070540985a.5.1772046736849;
        Wed, 25 Feb 2026 11:12:16 -0800 (PST)
X-Received: by 2002:a05:620a:440a:b0:8a2:ee8:e7cc with SMTP id af79cd13be357-8cb8c9cbf76mr2070536685a.5.1772046736335;
        Wed, 25 Feb 2026 11:12:16 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389a7a1feb7sm30070291fa.29.2026.02.25.11.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 11:12:15 -0800 (PST)
Date: Wed, 25 Feb 2026 21:12:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>
Subject: Re: [PATCH RFC 00/18] accel/qda: Introduce Qualcomm DSP Accelerator
 driver
Message-ID: <vgcb4n6ciybslspdoa5fkvb5zwz7xon6tnxjmxxzkqutabgoq2@sgbxxtgdyeig>
References: <vU2QyEVqOu-D3eGp7BZFICUeauxL32bwWzeidOAijoeVaJTk8KcRVsaQQD4MdFQEcaQTZ5RkzRsz9-Lhl1qsqg==@protonmail.internalid>
 <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <172a9083-8cd6-428f-bd3d-d831e610b37b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <172a9083-8cd6-428f-bd3d-d831e610b37b@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDE4MCBTYWx0ZWRfXwOE25MhACHqp
 MmSV8tgP2JOLu5UjteEMcOmggt4zWO31UmFJ9qEQGN6RGBxM+KWTBLWzKnWQfpd43rONN3JcXO2
 xyRgLs4f1BdbZPqNJu3lb1KtnFObm8EThF8cnBbyvbxWvbVtv9yjKaIP/zf7+PL374MmLuxz3TA
 7Xo9WNQly6we89ekUv5r7wf1crGVZ481JlXXx1PGIJ+Fc9jeXE2Ov36HtZFJG38cHeAlMHuHyS8
 ppJ6wev5lE2uVkRxEidSKoJ98u6xeMy3r3seqmfwIeKX6Lx2gK6S0dMluWhHQTD64YdBBLPod9x
 JqR3ufO05zDA3Na+51IP9hXfyC+R5KSGjSrmVu2+QuYWhowj6Rq68swbZ9oKbW24/ON1p3LVV6i
 3K982Z2J2tJ2w79m737NxSTc7ZqZUI2LMiJtO8n8RnjLN14UoGyB8l0aDjxfhN8iFEt8b8agRcU
 kbnayKTqCryELM5d1UA==
X-Proofpoint-GUID: 0NF8z-45lWoVa6cPnVqSS9ytK2SEqeO1
X-Proofpoint-ORIG-GUID: 0NF8z-45lWoVa6cPnVqSS9ytK2SEqeO1
X-Authority-Analysis: v=2.4 cv=etXSD4pX c=1 sm=1 tr=0 ts=699f4991 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=NEAV23lmAAAA:8
 a=DISFzqtZAAAA:8 a=jajewSGiAXp_dDDQNc8A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=aug85vrO5LANNmmtkfAW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_02,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250180
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94183-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.linaro.org,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,tomeuvizoso.net:url,qualcomm.com:dkim,oss.qualcomm.com:dkim];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F338719CA5F
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 01:42:19PM +0000, Bryan O'Donoghue wrote:
> On 23/02/2026 19:08, Ekansh Gupta wrote:
> > User-space staging branch
> > ============
> > https://github.com/qualcomm/fastrpc/tree/accel/staging
> 
> What would be really nice to see would be mesa integration allowing
> convergence of the xDSP/xPU accelerator space around something like a
> standard.

I'd say, writing Mesa compiler to build Hexagon code for Teflon frontend
would be a nice item. It would probably also allow us to use DSPs for
OpenCL acceleration. But, I'd say, it's a separate topic.

> 
> See: https://blog.tomeuvizoso.net/2025/07/rockchip-npu-update-6-we-are-in-mainline.html
> 
> ---
> bod

-- 
With best wishes
Dmitry

