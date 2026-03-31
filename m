Return-Path: <linux-arm-msm+bounces-100962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPxpBQeCy2kKIgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 10:12:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 61700365E20
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 10:12:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1238E3053A64
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 08:05:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AD1B3D75AA;
	Tue, 31 Mar 2026 08:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U9dZDhn/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MRGlci+B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1173D7D70
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 08:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774944349; cv=none; b=Z7c1sXQipaBPJwCuRDnAZ3FMzf82MDlkBG77dEimQ9yt5mBWVKdRP/cIxY0vsrADLKfbPhBBzPZkeCHDflHHlIqX+rcNs5A9wWwnQQyueEKwXsTMZ3OwcFExvi0DzJ81Xlz+sXVP4QN/bCI3lH1mK4qJsZYANzotXq1+7HcLY+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774944349; c=relaxed/simple;
	bh=BhXC0GtVHCN2Tj8UAAkThZ6AYQN45Yk44Ph4C+yRu5A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uOTMxkVC0aSqmCQpZqBLMmG0o+yaN8zlnI+EtDNgKhcBHYaPbGqf1UVPqs7ifMYaVtZqpq7ByjwZwcigngMy8ECb0l1QEWpnDSCJMJFhhU0xXLD+NlWh8B/eStWSGvzPb6h9k6AFakyXvuUaeUedDbuO1sijCk2YfNxg7G1368g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U9dZDhn/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MRGlci+B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V6mZT62391396
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 08:05:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NDHJxRI5yl1MwK0pti2UT39tfMbBYzkYJ/AGWXl8b4Q=; b=U9dZDhn/8+nZVW/5
	Nw3MrkjHYYTzlNAeTP3EfyWm104RupkrFjanVfdKqzN34c3tdFFmQfg9pfkZCDO5
	cJg1359cqxqbtAwvorc8mGnMOfdtYe2B59eo5PX3u+KEqv6RX6lhKoGBkYxoqRQo
	12+8nG/9BRLSNNj3fn+y6fIPytoCW+CE20q2qgBsjCRm+4nBVljRX3zwppC8zm3o
	QkFpNSiN0VA3v3vzpy/5TkqXKTiK5O3lIDWS5jPGzMPt1aTW7zGt2irzeMJUn+TT
	h3W773XBbLh0Z1gnkr3SyERIKNVPwu2M7wtfQoNyWAwMVmAU9Jj4iY5NNbbu5WZL
	9S4E8A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7ue7kfgu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 08:05:44 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89ed6f0c71aso11779086d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 01:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774944343; x=1775549143; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NDHJxRI5yl1MwK0pti2UT39tfMbBYzkYJ/AGWXl8b4Q=;
        b=MRGlci+BaYqM4g05ApBn2frwN54od3w7k8ozg8MJGLh40uKyEaQq6VNYS+QGJyop45
         yhYM99Gpzm/LtjXFJkoR3A+15TcO2fbTuo57/rtdVPomteXzhYqr1ztEu0FrDos3/NXe
         dpd75tCuQmETmzG7o5owr16bfFeS2Cx6AeFenSaVQ/lU99/laMuWn+zWaeM6O/G4WpTY
         BzAhJqzlHw36YX8taqA5V6Xvc81bJ+jqBO3FExL1UdgQTjdjDKFJpqfYAmLQa33kC2vi
         W2h0FmZXVv4CYfNYaineil5sP7dg3iXN3BhFGwOzDTUF3qpA606qbQhyb0u+mLe7UwTU
         RhaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774944343; x=1775549143;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NDHJxRI5yl1MwK0pti2UT39tfMbBYzkYJ/AGWXl8b4Q=;
        b=sRuKs2lCbhJm+MbjNpBuBsgkWKlN0dbUBGo1i9Wq6WD1TOFAcVkorPZS3MVXMTOxHn
         RV6yAPQHodlf18NYDLcnrGdHQhZYBmvQmBZwBi4VSJNGByjc/Ngixx+oh9NAdfW6f1hZ
         QzwtLT2kkkvYvEwmCTW72GMuzUaL1JJBLJvc3qdIqtwZwSXSR/QUM9HLzlU9gTK0HhJn
         my+iS7qxhMGxgfJY/6n7pVUIT+NqQqYoj78BuU7KsUMkv1EongzHr49jDxXr8OW5vPUK
         G0daOJZrpdw11hmqCk5ioNPJN19ZgfjCorjb49UcbjN0uyjG46IOTL0J6lFtvO/f/or5
         THoQ==
X-Gm-Message-State: AOJu0YwoY0hhnk4Z5P/iiFtUNtr660we7VCFNHnS1IvHu86IXc+6I0JH
	wTCrbvJp64R8F37R4MRV4kpGnht0a/zNnrhRosqz6O4ZYTYAK/uOB37zbNH1HI8akeaLulS5NYz
	bPNNAlymQvsmLBHSi40P+EAKIbTdyKo3qpkt8vzRQmfGkEokaxqH3hVUeTdU5kYnxHr+b
X-Gm-Gg: ATEYQzzH+R56A6Ua3DuP/mMpMAcD77bKoWgtLpnuk6R63rqrCnY/YHGK5R8YhmKWGX2
	KtToSiJGGwXDQ2U2GyxlZ48Hd/dqNpx/oxlQQL1IFqobqLMtjteNdc960/lQBJaXyX9X7r/jWm4
	gq6fRABIzPmOyMlNUNoEXm0oblzbSwkQ3p7TNiFsBacf4zYGrGLvKJGWffAvZ42TOPYqF7b8B+f
	tMy7iYDEufUTAu0Zk37m6LSDOEQscAF/UevIeWd2XmwrzQQu2xh3YQjtZWjg+Ow1bimFejn7Uw4
	nDAG0pd1QjXWBPFxU9vkK2cEjbtOYH3ZcM1mz5+4SLH8EYHVRfoK7ceiqoDEulfYnjBXNgPkfMV
	j7nIbW4mPNbXHps/WQoFQacpplmoOftrRGQp5GTLGr3F768+vAnnKyNkLpMfV4Ek+mEvidkaCWr
	p9HFo=
X-Received: by 2002:a05:6214:1bcd:b0:89c:e371:2b42 with SMTP id 6a1803df08f44-89ce8d33cfemr165233066d6.2.1774944343145;
        Tue, 31 Mar 2026 01:05:43 -0700 (PDT)
X-Received: by 2002:a05:6214:1bcd:b0:89c:e371:2b42 with SMTP id 6a1803df08f44-89ce8d33cfemr165232866d6.2.1774944342701;
        Tue, 31 Mar 2026 01:05:42 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae57679sm378701166b.25.2026.03.31.01.05.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 01:05:41 -0700 (PDT)
Message-ID: <f31e9f5f-323a-479f-bbb8-71415824c950@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 10:05:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] soc: qcom: pd-mapper: Add support for Eliza
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260330-eliza-soc-pd-mapper-v2-1-5f10880a2b66@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260330-eliza-soc-pd-mapper-v2-1-5f10880a2b66@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA3NiBTYWx0ZWRfX0gYkFODWLxL5
 zOAyGGJePIYd/g80MEx++eU5o2owRVB9YpGrpdZQ11rZJj0kA0ehsgwMdlvdghE0tvj9R0OeRvv
 9SyWjknzSQ4IhTeWvAS5PwoY0o+iySWIM58ZeotxiIs1FTI4tLQe5NmI/xrGCK+FpwlCtN4cvT8
 vVR15P+1nPXKkszop/+BZwbVoRZpWoK9M+ptg4MzAsNzeWqbUcZXtRV6qhTFXZcCghT7J/CSNaT
 rkLrixqeqUqbC09d3e0tVZRtBCU4fGJPlrfy33Y9o2tvXsWnm7HMzkaOSf1E4udoKQjc6Fcn37c
 rdE8PCh0rIbwONlbIlJVcDsWNe1sQv9cLNL49GUtehDxjyRgjg2HricMZ79NnNQbcO9X4Xd/UpY
 wSv9ORpxk1EdV21NYrlkMcQI2DTzcRu4O4MxQdv1qc4fvGgQaLO9iG/6yQkp7aLqrfQhlZIZ3HM
 Yq/LMWfeeh6f0n64V8A==
X-Proofpoint-GUID: gS8tT7v2uiGOXWdq-9LwHfAFrS076Gf1
X-Authority-Analysis: v=2.4 cv=G7sR0tk5 c=1 sm=1 tr=0 ts=69cb8058 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ob3S-hXYARn5H7NJBicA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: gS8tT7v2uiGOXWdq-9LwHfAFrS076Gf1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310076
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-100962-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 61700365E20
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/30/26 4:30 PM, Abel Vesa wrote:
> Add support for the Qualcomm Eliza SoC to the protection domain mapper.
> 
> It has the same exact protection domain configuration as SM8550 SoC,
> so reuse that.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

