Return-Path: <linux-arm-msm+bounces-90547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MAawBTpYd2lneQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 13:04:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B7E87FA0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 13:04:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 12AD1301DB8C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 12:03:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76607334368;
	Mon, 26 Jan 2026 12:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SNMOC6BR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZbQAjjB7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD2E2FB962
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 12:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769429024; cv=none; b=hf2un5T8xNKNhgKhHUnI6WB2dltRlSpHGLWf1QMLbzK2DndtKRh+/KT8WuJiSjQq9mRwlsnoCtirTYhrY6FOqK6/+38QvrbKbmtL1te8UZKWjHZF2Im4R9Td8+69VQ/54VAu2boGoAIM2mxfmBBK73O+xmKrtJ941Pjmu9bCeZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769429024; c=relaxed/simple;
	bh=w7e7pGKwezjDcmXnl4zz9STrcOeCZUcGCbi2rpG4NiE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hLLhojgdYKpP/+VylPtVWU6Ca7Px9NOpe9aCQj8Skfp1xYq35ZbHl5+vMpdgd6XSN6xMijla4Yd92AaILUO+S+90x85YjHTlbqPqzpCOeAohVhUNbrCr7jixDsTyEg5FQgy38toonuOmgVry4/NcfOJNZioj+1BZF1aiy1vUgkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SNMOC6BR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZbQAjjB7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q5ULGX1019118
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 12:03:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=64KB8OzEkT5gWqO6/CaUtd63
	hLK0dusVTvRfE5xlGVw=; b=SNMOC6BRaNJdkAfdD4DUb4Z4ODyiRDxcGXfQzJeB
	q0o/9XpstfesVc9VAFuJ7abGO/9DK/tY3sfq7DO6ar+Ni/TUBuvDLs87LOUzF+j6
	OEQ6jVdHVc1APqk09nuElRHqLTdQpbTbAL6/vJsQ/zjM0sGCH3OUIVRmpptUkUkV
	6lqWeHg/N7fkMGCzwNjgDQv03h6p44GYy0A7iC5169ezxm8TArMAugeUllkJWCuR
	FR9pUpvv8+9lJ6r1MOUZ6sAb+GDhklwNpQbCcHq0ooYCeHqJVCddYo0b6fP0WgzR
	BaM2b0cBT5E+rAWbZA2UCVR4+zZn3YCo7TTwqBZYbXqmzQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bx2680x0r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 12:03:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6ad709d8fso965344085a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 04:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769429021; x=1770033821; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=64KB8OzEkT5gWqO6/CaUtd63hLK0dusVTvRfE5xlGVw=;
        b=ZbQAjjB7ZlRtPcn6DBNn/pLbLt8eGU+VH7PghZBdB3z0XKWEznkzweZhDADvj+pKFo
         /AY4ENrYNOLG9J7Ma/+cN9imwIZzmYdbFUKbiEIX+DJwruYECh6LvySe/MfWQh6RfNNz
         7MFbei7kdy5HIjVEpBVCeO645hb1gOdWLVChSRvHps+UI7LFLc7OGKXkjbWQi43uLGPv
         ahDo5UfpqzlMFKQOIH1EedE3sIfv4UbymHHHFQbdJ2PAGcHk0qpQ1CElklOZfe5M31u8
         vf0Gt/qaWCWchx6f49PZ7Bh5FO0hmW9aSz4nJ1HTUi+Bko9WDW7EbdlWoijtXrzSqA26
         y1bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769429021; x=1770033821;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=64KB8OzEkT5gWqO6/CaUtd63hLK0dusVTvRfE5xlGVw=;
        b=fQ9/kTgJhIbc2Vx3CZ6kN0e82d3rk2RzGQvGNQfsmxHuKGeWXH3TUURUWn7rGxZAbk
         mVrWw4u4NywER0vXLmJ9EPUindimV+QoepVQn2dKPzsv0yA5ZFqD6zYpcAn9VyWp3xvT
         ThmCzAZzJ7TwmBF6x9is6ZwRI6USxLOi1sevJoaJfKS8W6c6kc33svJEcKsQqT6V85h8
         6i4vKzKg4RvXHpR3sZnWASLpxjyY28eHekzfkALVkqfa/94peAZsNXuNu4AB5XkNbI17
         gQqwDOKP/jRI24XD53VgP0nBqyZffULkrNnzsMi74yaKIBLQMmfLnieFIep0FhLzatjk
         wPZw==
X-Forwarded-Encrypted: i=1; AJvYcCVMZ5ByvLzLkGLBzdzP4itDRYd9ju9pw7ppEHKnWdElkUlZgYnLWKyTu3H9jroA8KwZLeP54/dFpqYeAhTc@vger.kernel.org
X-Gm-Message-State: AOJu0YzEBKv5iovnRqAQNc5bMTlcg8J38Q3qhCH6wV6Aqntyhrzrxdyb
	5AlKBmW96b/YSe1NKebj0cLub+sX+0RFVy/ET7ah+A3JwQ8ZOU7M6lV68pIN9U4p45Nto2hhmWa
	GldAItDz72sSjOZoxcXvRxP1bzK8yUqCzP6GTYFrn7ZFDEmyVL+MGcZOdk75h3BhwevzC
X-Gm-Gg: AZuq6aKjS9QFkO+mIJMxTd7av2EtPBjcvJC6/4rMXwXeaDuawtLTv8gzNs+iaQH93CF
	6un9HgImd9fW0c+En+sy/Stkfg363qGd8iBfVoSPfcCYX6zYlNAw2Pvz49vVDu2UAGWUiHMesW8
	B+YZHAUZ+L0pC8PFHRmlV7oYX2o9cRiWbZB2GdCe/4L5kT18JzKbfzqn4RhU5iimE9cfo8k9skH
	D4o3X/EpG9AL331uux1Brvey0GVHBhfvPui9qaDyGVhi8KYbcRHlS5rFNnUMQMM31r4m1Zqc2tl
	4m849aWSXWTcbN1qIe2niOlv40E8isH472BN5Ml469sXaSpH0EtXWamm6K3dV7t78vj0qgDelum
	fRa66QPnvPPawco4nvj6hJTEg
X-Received: by 2002:a05:620a:400b:b0:8c6:a4f6:ec9c with SMTP id af79cd13be357-8c6f98a23b4mr479033085a.31.1769429021425;
        Mon, 26 Jan 2026 04:03:41 -0800 (PST)
X-Received: by 2002:a05:620a:400b:b0:8c6:a4f6:ec9c with SMTP id af79cd13be357-8c6f98a23b4mr479028485a.31.1769429020783;
        Mon, 26 Jan 2026 04:03:40 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48046fba46dsm344304915e9.0.2026.01.26.04.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 04:03:40 -0800 (PST)
Date: Mon, 26 Jan 2026 14:03:38 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: vkoul@kernel.org, kishon@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, dmitry.baryshkov@oss.qualcomm.com,
        neil.armstrong@linaro.org, konrad.dybcio@oss.qualcomm.com
Subject: Re: [PATCH v2 6/6] phy: qcom: snps-femto-v2: Fix possible NULL-deref
 on early runtime suspend
Message-ID: <47fqiz47ujlczjxkx2qhnerc5kklz32hgt3cuza6zla67jlv7p@d5pwhejrekvb>
References: <20260121142827.2583-1-loic.poulain@oss.qualcomm.com>
 <20260121142827.2583-7-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121142827.2583-7-loic.poulain@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=bIEb4f+Z c=1 sm=1 tr=0 ts=6977581e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=pxQL0frbaL4a0zJdC2sA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDEwMyBTYWx0ZWRfX69T2/xvZlmaI
 yhd+iVBCEgfSB6Bc0i9d689QzmEjP5LxHJI+16TidXhQPVQTRbzimNduZDkXq6iguhkzlYMA5Od
 t32auwREmlQum9l2G36+jeHSgTFlVk74YLfYAqMsJ5ZnjPNeQrEqlGvnYSdFAh2WIyfGUO7Azes
 daPBFmvZT9VIWcW/prs9SJVaZ+crA5jKU4DUoGk2tc9GNoFdDgEYIv3Mw8mrkOIv6T28GgSzPUv
 x694MnXwJmKmlm/X3LWB7d84jjSJIcCtvknscwGP5rmF5O+r4Xs0q1I6JIPclOZJZkgfZf+CWGQ
 IUnRouKfcsi9ZhCWraj0Ci/pqROkHzauW+t+LsDHXiX7jnhYili0NSw875e96Zu7F2Fi1FIkggT
 ZqoicfFPgIKazb9Y8O++deTWRoT649k7kw12wL6vy2/7gOkBPlv3eW+Rt2hgre4lGKqxJF+TY3Z
 kNJSYVg+5ALEPuIsJbg==
X-Proofpoint-ORIG-GUID: ElTwg4ftzQ6fJzcmIslh9VGz46cDwKuZ
X-Proofpoint-GUID: ElTwg4ftzQ6fJzcmIslh9VGz46cDwKuZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601260103
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
	TAGGED_FROM(0.00)[bounces-90547-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 68B7E87FA0
X-Rspamd-Action: no action

On 26-01-21 15:28:27, Loic Poulain wrote:
> Enabling runtime PM before attaching the hsphy instance as driver data
> can lead to a NULL pointer dereference in runtime PM callbacks that
> expect valid driver data. There is a small window where the suspend
> callback may run after PM runtime enabling and before runtime forbid.
> 
> Attach the hsphy instance as driver data before enabling runtime PM to
> prevent NULL pointer dereference in runtime PM callbacks.
> 
> Reorder pm_runtime_enable() and pm_runtime_forbid() to prevent a
> short window where an unnecessary runtime suspend can occur.
> 
> Use the devres-managed version to ensure PM runtime is symmetrically
> disabled during driver removal for proper cleanup.
> 
> Fixes: 0d75f508a9d5 ("phy: qcom-snps: Add runtime suspend and resume handlers")
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

