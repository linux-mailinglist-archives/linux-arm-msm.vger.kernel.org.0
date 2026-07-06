Return-Path: <linux-arm-msm+bounces-116675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1OqDETNjS2pFQgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 10:11:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA87370DF37
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 10:11:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=TSrvGniE;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dyszFFNT;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116675-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116675-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0816E325F4B5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 07:27:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D739D3E8326;
	Mon,  6 Jul 2026 07:23:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB0D3E715A
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 07:23:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783322603; cv=none; b=b9IvHXDotVKzmDpUzMZyQK8Hbxe1r6iVNEunmg68qQYkZ4l3rGQef6YPpbaOZD3LRF/BDoUXLmbOURqKsuF/U7AxFvCGTasBS3KF2Gibreqa1mzRWk7/R8L2LSrwEeOhhiZQ32d+p14WLsr0OMEywDbwOZr4FsP1XchSMxQZhPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783322603; c=relaxed/simple;
	bh=cys8Q5SmvauIpgYMBctOa2YAbBaoLLimQhj9LG+4xwk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=XnCKQnXrYFwS4Ru8dOAIPd2I9BKwNtEvb8cGu5yZ+ngkWyqC3BEuIoHixK8VvJ+7v/r/SJDxKw5nrydbqY6WBFjn+d4fVSgnjemBsYxiNygM5mzz/GH91YqJxGW/gaMFPSziZHAaq6rWs5muHisjhRbDjLXgJJygCYt5bMYYMS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TSrvGniE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dyszFFNT; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641TU73470431
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 07:23:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0uTFHwmHTm+HZ5aosE4bWPbYsQ5oqAsS84u+0360UFg=; b=TSrvGniEG8EBAN8P
	jFST7SJ3OTGVX/Ztc/HuZha0n52tEUTvKD7LcbI61aMRxwew17i4vVklPuyVUyWB
	0/vz0w1hmY5YNrqpDQaOZSwO2ph37d2N/TiMKs+//8ffGQTwRfGl5TMUmJONM2ic
	Xpun0/hz2aeU2AeCwed7ABxmRfRuc4+Kd8bfvO4kgOR4JL3Nn09h/6nqg1giOD5z
	tHP7X8fAqN8J+/R4+3fj2dukSlEz1nczdoaPWVxDBsO+sLuOvCzIyarbFuTJXFpJ
	Pe4T4q3K6y2+AAQr4hK9LRbIU4FLsikqmuAQ0pgAtQtTUWCKVy8QmU1ltQuATv4U
	mg+btg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6txemw32-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 07:23:11 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36d97955899so3727405a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 00:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783322591; x=1783927391; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0uTFHwmHTm+HZ5aosE4bWPbYsQ5oqAsS84u+0360UFg=;
        b=dyszFFNT4zNoV4vesUcwb8CRH/jtTpRN9kqF7ypIgE3BBSRy6n+/Urq0bNBzMP17E+
         u8fW5MgYsNIiX3ebNJBryU2SmPvj3whrAc4d2HbZtaBnkK9CHbHcd1q8yCTGJNixa1uR
         3XgYcUiDOTK8VJA1CbqPk9wgr90l2NzgzU1COuvs6b85tAwPwhj8becU1LJoqApCduMB
         iJSZ2pi3m35vYxo45u6PnAz7eOvyQEbeGWk5P9Xn9WN2dHhPtxfyip0rxDm1FCYEOKRr
         3slWUDDWYa7Nsjxi9gsZHLxTHmGbPeBTmc5at2iGDn87DTsyQ2lHUtV4+SpX4SlWv+eo
         V2yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783322591; x=1783927391;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0uTFHwmHTm+HZ5aosE4bWPbYsQ5oqAsS84u+0360UFg=;
        b=gXr7kTjW7fWBkNbPLBba2i7MDnJapRLQ5AuQ1fiOmW0bfNJjh5rc2k/Y29Kx4OoSlb
         ARCUf30nx3Z3cAktjERBBzqN3kVlynWc+zzzhMyE5v4raPZNo6CiyaVZOjILlufddlRB
         5fe20lS2AprjFPVRhLxcd2VbRfsExqXR8pfhdlvDUXOYZjkRSgKBTIp8F9OfP/SKsSbo
         5aoFs1hbp3494Qu5j/4VAlEEmyr61gs6OxiPaRyALjR7CmgYzLlPBMXg/mWqk9xyrHN4
         mY4CZO6j2ZL+8LIr0UshZTHHSwBVAE4HO1e+XiYCUwX5IIgbmIM0OkRcNVReHqDoj7Dg
         x08Q==
X-Forwarded-Encrypted: i=1; AHgh+Rpd02ivtag4AbY6MhuUaQly+AaO2R10ubhoCnIPBdG5b8h0tinv0UK1KJ90qiENhdobXKrXq56BRYnCyjRg@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7ZmI0nwGJR5xI6++UTgfDK+E5NThx0B7pYaq0IQgZ2cBSveHE
	IOZEYcgRkJvroYgoQ+vyTeKIKFVQ3Q7WieQ5nLxhY6FDzws9nwPCbISAy4XNHh5OH2U3VdDA63L
	OdudmC1kPa9tb5JbhjxYeVIWMy6RD9PIkrgHBSVK2uUeeSDKGjZDLoehY/GqOGGGGDW/y
X-Gm-Gg: AfdE7cm9vURIpwl9vZBi3E87pFnj3xqdbq0L6bVVcOZSzkJ0NUubH0PkOMLNkCMRVwz
	jqEoegNtFbEs8PHGx49dza+S60xa17PbcQ9k9maI3WrbWaOVi6rjqkn70KyC5yTrWr4eE9ZbIji
	IUbsUplBR9OSAjFo5RlU7I3YiNLsKbX6vRQ1JVJLbTMhVVbVvQuc6sw1q6kk1G43KAYyTY7RqHv
	uQaO/cIsfljXthSwHbqV5QLSAUNEYbCnHRJTF9lqKgTwxwSoZ1115pyxt6qJREmuXg+V3Jhk0ta
	0WnTf69rfgvyDeCUFYYGdbeMqp8mn/IXuBOfx9/RJaiqBiru2rFR9gN9nSLry0sI8ujKbA+bOYf
	WCVrXPPoOQd2eYetJrOY4o2cB6vufolK2SGrfR8c=
X-Received: by 2002:a17:90b:3b8a:b0:380:9d0d:7ade with SMTP id 98e67ed59e1d1-3825c50c9cbmr9403117a91.0.1783322591306;
        Mon, 06 Jul 2026 00:23:11 -0700 (PDT)
X-Received: by 2002:a17:90b:3b8a:b0:380:9d0d:7ade with SMTP id 98e67ed59e1d1-3825c50c9cbmr9403055a91.0.1783322590481;
        Mon, 06 Jul 2026 00:23:10 -0700 (PDT)
Received: from [10.217.216.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3835bd053d1sm2075944a91.2.2026.07.06.00.23.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 00:23:10 -0700 (PDT)
Message-ID: <e7e3af50-a11e-4c18-8bea-07d059fb8c4b@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 12:53:05 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: videocc-x1p42100: Constify
 qcom_cc_driver_data and list of critical CBCR registers
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260705171811.115542-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260705171811.115542-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260705171811.115542-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA3MiBTYWx0ZWRfX5zNhYThmyxCx
 F8uVI0/xvQ0MFUj/aK6fUMmoj2Vl02f633nnjI/AaS4a54kgq+2O5mAFe+cWmVg/qxuN/zFOKa8
 hmkLb5bZyvfs8VIxBbBkXZBumn/grzI=
X-Proofpoint-GUID: Dny0bdkl7rs7ICXESfy_ct72qY1m_HPA
X-Proofpoint-ORIG-GUID: Dny0bdkl7rs7ICXESfy_ct72qY1m_HPA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA3MiBTYWx0ZWRfX9EHlfJTQbhv+
 UlsE0/2hd2g0uWk2pO+aM7JhPjARaSURB2YCshQLiKgPMzNUs9lArCKLx3WeXK+jGMTivi5JnCM
 MVOVuyQNxpgimLlpB0Of1O/FHGz5vNAh/JWx5W89wkug8/ly+F/VaSVM8uoKfd6EBIb5DynS6UR
 M2j+fuhJu9NdwVJFfLZ09MDxPqkR5TT9FiDIGyTPfKRTihqy6jw0sKrLFuqIzcVnurEUJQVjEm5
 xi7qvrGTlPTyoLBfIi6Nb6Tto52KYfuIHj028wYLHFIwcVbSa9M4Okzu6noIc9t764VDDTAiRjQ
 +yLptAWC7YM1ZaYGdsFQMNaP8w3Npd/ixNGqXQnfIshf25RhLuKDyLUInPrP2b9airtGr2VZOdV
 FQWD/FOSDNnRi8YIokpTGgM2o+SzPVn4a4VATDovAm0cEBX5ueT8SEpuqFn5QYpi7JZpk5+TB/J
 XDl5yZYBi1YBB+PeoLA==
X-Authority-Analysis: v=2.4 cv=HLLz0Itv c=1 sm=1 tr=0 ts=6a4b57df cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=_aGr2jj6gUJWDCgJmWoA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060072
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116675-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DA87370DF37



On 7/5/2026 10:48 PM, Krzysztof Kozlowski wrote:
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/videocc-x1p42100.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das


